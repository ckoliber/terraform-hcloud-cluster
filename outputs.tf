output "ssh_key" {
  value       = hcloud_ssh_key.this.id
  sensitive   = false
  description = "Cluster SSH Key"
}

output "roles" {
  value       = toset([for _, val in var.servers : val.role])
  sensitive   = false
  description = "Cluster Roles"
}

output "servers" {
  value = {
    for key, val in terraform_data.this : key => {
      role       = var.servers[key].role
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
