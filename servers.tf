data "hcloud_image" "this" {
  name        = "ubuntu-22.04"
  most_recent = true
}

resource "hcloud_placement_group" "this" {
  count = var.spread ? 1 : 0

  name = var.name
  type = "spread"
}

resource "hcloud_server" "this" {
  lifecycle {
    ignore_changes = [image, ssh_keys]
  }

  for_each = var.servers

  name         = each.value.name != null ? each.value.name : "${var.name}-${each.key}"
  server_type  = each.value.type != null ? each.value.type : "cpx21"
  image        = each.value.image != null ? each.value.image : data.hcloud_image.this.id
  location     = each.value.location
  datacenter   = each.value.datacenter
  firewall_ids = each.value.firewalls
  ssh_keys     = concat(each.value.ssh_keys, [hcloud_ssh_key.this.id])
  labels       = each.value.labels

  placement_group_id = (var.spread && each.value.role == "master") ? hcloud_placement_group.this[0].id : null

  user_data = templatefile("${path.module}/scripts/setup.sh", {
    gateway = try(var.bastion.gateway, "")
  })

  public_net {
    ipv4_enabled = (try(var.bastion.gateway, null) == null)
    ipv6_enabled = (try(var.bastion.gateway, null) == null)
  }

  dynamic "network" {
    for_each = each.value.network != null ? { 0 : each.value.network } : {}
    content {
      network_id = network.value
      alias_ips  = []
    }
  }
}

resource "hcloud_server_network" "this" {
  for_each = {
    for key, val in hcloud_server.this : key => val
    if var.servers[key].network != null
  }

  server_id  = each.value.id
  subnet_id  = var.servers[each.key].subnet
  network_id = var.servers[each.key].network
}

resource "terraform_data" "this" {
  for_each   = hcloud_server.this
  depends_on = [hcloud_server_network.this]

  input = {
    type                = "ssh"
    host                = (try(var.bastion.gateway, null) == null) ? each.value.ipv4_address : hcloud_server_network.this[each.key].ip
    user                = "root"
    private_key         = tls_private_key.this.private_key_openssh
    bastion_host        = try(var.bastion.host, null)
    bastion_port        = try(var.bastion.port, null)
    bastion_user        = try(var.bastion.user, null)
    bastion_private_key = try(var.bastion.private_key, null)
  }

  connection {
    type                = self.input.type
    host                = self.input.host
    user                = self.input.user
    private_key         = self.input.private_key
    bastion_host        = self.input.bastion_host
    bastion_port        = self.input.bastion_port
    bastion_user        = self.input.bastion_user
    bastion_private_key = self.input.bastion_private_key
  }

  provisioner "remote-exec" {
    inline = ["cloud-init status --wait"]
  }
}
