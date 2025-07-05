resource "hcloud_placement_group" "this" {
  for_each = { for key, val in var.groups : key => val if val.type != null }

  name   = coalesce(each.value.name, "${var.name}-${each.key}")
  type   = each.value.type
  labels = each.value.labels
}

resource "hcloud_server" "this" {
  for_each = var.servers

  name                       = coalesce(each.value.name, "${var.name}-${each.key}")
  server_type                = each.value.type
  image                      = each.value.image
  labels                     = merge(each.value.labels, { for group in each.value.groups : "${var.name}/group" => group })
  location                   = each.value.location
  datacenter                 = each.value.datacenter
  delete_protection          = each.value.protection
  rebuild_protection         = each.value.protection
  firewall_ids               = each.value.firewalls
  ignore_remote_firewall_ids = true
  ssh_keys                   = each.value.ssh_keys
  user_data                  = templatefile("${path.module}/templates/user_data.yml", { public_key = var.public_key })
  placement_group_id         = try([for group in each.value.group : hcloud_placement_group.this[group].id if var.groups[group].type != null][0], null)

  public_net {
    ipv4_enabled = each.value.public_ipv4
    ipv6_enabled = each.value.public_ipv6
  }

  dynamic "network" {
    for_each = each.value.private_ip != null ? { 0 = each.value.private_ip } : {}
    content {
      network_id = network.value[0]
      alias_ips  = []
    }
  }

  lifecycle {
    ignore_changes = [user_data]
  }
}

resource "hcloud_server_network" "this" {
  for_each = {
    for key, val in var.servers : key => val
    if val.private_ip != null
  }

  server_id  = hcloud_server.this[each.key].id
  subnet_id  = try(each.value.private_ip[1], null)
  network_id = each.value.private_ip[0]
}

resource "hcloud_volume_attachment" "this" {
  for_each = {
    for item in flatten([
      for key, val in var.servers : [
        for volume in val.volumes : {
          key = "${key}_${volume}"
          value = {
            server_id = hcloud_server.this[key].id
            volume_id = try(hcloud_volume.this[volume].id, volume)
          }
        }
      ]
    ])
    : item.key => item.value
  }

  server_id = each.value.server_id
  volume_id = each.value.volume_id
  automount = true
}

resource "terraform_data" "this" {
  depends_on = [hcloud_server_network.this]
  for_each   = hcloud_server.this

  input = {
    type                = "ssh"
    host                = coalesce(each.value.ipv4_address, hcloud_server_network.this[each.key].ip)
    port                = "22"
    user                = "root"
    private_key         = var.private_key
    private_host        = try(hcloud_server_network.this[each.key].ip, null)
    bastion_host        = try(var.bastion.host, null)
    bastion_port        = try(var.bastion.port, null)
    bastion_user        = try(var.bastion.user, null)
    bastion_private_key = try(var.bastion.private_key, null)
  }

  connection {
    type                = self.input.type
    host                = self.input.host
    port                = self.input.port
    user                = self.input.user
    private_key         = self.input.private_key
    bastion_host        = self.input.bastion_host
    bastion_port        = self.input.bastion_port
    bastion_user        = self.input.bastion_user
    bastion_private_key = self.input.bastion_private_key
  }

  provisioner "remote-exec" {
    inline = ["cloud-init status --wait || true"]
  }
}
