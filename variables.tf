variable "name" {
  type        = string
  default     = ""
  sensitive   = false
  description = "Cluster Name"
}

variable "ssh_keys" {
  type        = list(string)
  default     = []
  sensitive   = false
  description = "Cluster SSH Keys"
}

variable "public_key" {
  type        = string
  default     = ""
  sensitive   = true
  description = "Cluster Public Key"
}

variable "private_key" {
  type        = string
  default     = ""
  sensitive   = true
  description = "Cluster Private Key"
}

variable "hcloud_zone" {
  type        = string
  default     = "eu-central"
  sensitive   = false
  description = "HCloud Zone"
}

variable "hcloud_token" {
  type        = string
  default     = ""
  sensitive   = false
  description = "HCloud Token"
}

variable "hcloud_network" {
  type        = string
  default     = ""
  sensitive   = false
  description = "HCloud Network"
}

variable "hcloud_gateway" {
  type        = string
  default     = ""
  sensitive   = false
  description = "HCloud Gateway"
}

variable "hcloud_bastion" {
  type        = any
  default     = ""
  sensitive   = false
  description = "HCloud Bastion"
}

variable "masters" {
  type = map(object({
    type       = string
    location   = string
  }))
  default     = {}
  sensitive   = false
  description = "Cluster Masters"
}

variable "workers" {
  type = map(object({
    type       = string
    location   = string
  }))
  default     = {}
  sensitive   = false
  description = "Cluster Workers"
}