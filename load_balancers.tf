resource "hcloud_load_balancer" "this" {
  for_each = var.load_balancers

  name               = coalesce(each.value.name, "${var.name}-${each.key}")
  load_balancer_type = coalesce(each.value.type, "lb11")
  network_zone       = coalesce(each.value.zone, "eu-central")
  location           = each.value.location
  labels             = each.value.labels

  algorithm {
    type = coalesce(each.value.algorithm, "round_robin")
  }
}

resource "hcloud_load_balancer_network" "this" {
  for_each = {
    for key, val in hcloud_load_balancer.this : key => val
    if var.load_balancers[key].network != null
  }

  load_balancer_id = each.value.id
  subnet_id        = var.load_balancers[each.key].subnet
  network_id       = var.load_balancers[each.key].network
}

resource "hcloud_load_balancer_target" "this" {
  depends_on = [hcloud_load_balancer_network.this]
  for_each   = hcloud_load_balancer.this

  load_balancer_id = each.value.id
  type             = "label_selector"
  label_selector   = "${var.name}/role=${each.key}"
  use_private_ip   = (var.load_balancers[key].network != null)
}

resource "hcloud_load_balancer_service" "this" {
  for_each = {
    for item in flatten([
      for key, val in var.load_balancers : [
        for src, dest in val.mapping : {
          key = "${key}_${src}"
          val = {
            id   = val.id
            src  = src
            dest = dest
          }
        }
      ]
    ]) : item.key => item.val
  }

  load_balancer_id = each.value.id
  protocol         = "tcp"
  listen_port      = each.value.src
  destination_port = each.value.dest
}
