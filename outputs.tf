output "connections" {
  value       = { for key, val in terraform_data.this : key => val.output }
  sensitive   = false
  description = "Cluster Connections"
}
