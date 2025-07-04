resource "hcloud_load_balancer" "this" {
  for_each = var.balancers

  name               = coalesce(each.value.name, "${var.name}-${each.key}")
  load_balancer_type = each.value.type
  network_zone       = each.value.zone
  labels             = each.value.labels
  location           = each.value.location
  delete_protection  = each.value.protected

  algorithm {
    type = coalesce(each.value.algorithm, "round_robin")
  }
}

resource "hcloud_load_balancer_network" "this" {
  for_each = {
    for key, val in var.balancers : key => val
    if val.private_ip != null
  }

  load_balancer_id = hcloud_load_balancer.this[each.key].id
  subnet_id        = try(each.value.private_ip[1], null)
  network_id       = each.value.private_ip[0]
}

resource "hcloud_load_balancer_target" "this" {
  depends_on = [hcloud_load_balancer_network.this]
  for_each = {
    for item in flatten([
      for key, val in var.balancers : [
        for group in val.groups : {
          key = "${key}_${group}"
          value = {
            load_balancer_id = hcloud_load_balancer.this[key].id
            label_selector   = "${var.name}/group=${group}"
            use_private_ip   = val.private_ip != null
          }
        }
      ]
    ]) : item.key => item.value
  }

  load_balancer_id = each.value.load_balancer_id
  type             = "label_selector"
  label_selector   = each.value.label_selector
  use_private_ip   = each.value.use_private_ip
}

resource "hcloud_load_balancer_service" "this" {
  for_each = {
    for item in flatten([
      for key, val in var.balancers : [
        for mapping in val.mappings : {
          key = "${key}_${mapping}"
          value = {
            load_balancer_id = hcloud_load_balancer.this[key].id
            protocol         = split(":", mapping)[0]
            listen_port      = tonumber(split(":", mapping)[1])
            destination_port = tonumber(split(":", mapping)[2])
          }
        }
      ]
    ]) : item.key => item.value
  }

  load_balancer_id = each.value.load_balancer_id
  protocol         = each.value.protocol
  listen_port      = each.value.listen_port
  destination_port = each.value.destination_port
}
