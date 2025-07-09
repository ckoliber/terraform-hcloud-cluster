variable "name" {
  type        = string
  default     = null
  sensitive   = false
  description = "Cluster Name"
}

variable "bastion" {
  type        = any
  default     = {}
  sensitive   = false
  description = "Cluster Bastion"
}

variable "public_key" {
  type        = string
  default     = null
  sensitive   = true
  description = "Cluster Public Key"
}

variable "private_key" {
  type        = string
  default     = null
  sensitive   = true
  description = "Cluster Private Key"
}

variable "groups" {
  type = map(object({
    name   = optional(string)
    type   = optional(string)
    labels = optional(map(string), {})
  }))
  default     = {}
  sensitive   = false
  description = "Cluster Groups"
}

variable "volumes" {
  type = map(object({
    name       = optional(string)
    size       = optional(number, 10)
    labels     = optional(map(string), {})
    format     = optional(string)
    location   = optional(string)
    protection = optional(bool)
  }))
  default     = {}
  sensitive   = false
  description = "Cluster Volumes"
}

variable "servers" {
  type = map(object({
    name       = optional(string)
    type       = optional(string)
    image      = optional(number)
    labels     = optional(map(string), {})
    location   = optional(string)
    datacenter = optional(string)
    protection = optional(bool)
    firewalls  = optional(list(number), [])
    ssh_keys   = optional(list(string), [])
    volumes    = optional(list(string), [])
    groups     = optional(list(string), [])

    public_ipv4 = optional(bool, true)
    public_ipv6 = optional(bool, true)
    private_ip  = optional(list(any))
  }))
  default     = {}
  sensitive   = false
  description = "Cluster Servers"
}

variable "balancers" {
  type = map(object({
    name       = optional(string)
    type       = optional(string)
    zone       = optional(string)
    labels     = optional(map(string), {})
    location   = optional(string)
    algorithm  = optional(string)
    protection = optional(bool)
    mappings   = optional(list(string), [])
    groups     = optional(list(string), [])

    private_ip = optional(list(any))
  }))
  default     = {}
  sensitive   = false
  description = "Cluster Balancers"
}
