output "servers" {
  value = {
    for key, val in terraform_data.this : key => {
      groups     = var.servers[key].groups
      volumes    = { for name, _ in var.servers[key].volumes : name => hcloud_volume.this["${key}_${name}"].id }
      connection = val.output
    }
  }
  sensitive   = false
  description = "Cluster Servers"
}

output "load_balancers" {
  value = {
    for key, val in hcloud_load_balancer.this : key => {
      public_ipv4 = val.ipv4
      public_ipv6 = val.ipv6
      private_ip  = try(hcloud_load_balancer_network.this[key].ip, null)
    }
  }
  sensitive   = false
  description = "Cluster Load Balancers"
}
