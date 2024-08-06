variable "name" {
  type        = string
  default     = ""
  sensitive   = false
  description = "Cluster Name"
}

variable "spread" {
  type        = bool
  default     = false
  sensitive   = false
  description = "Cluster Spread"
}

variable "bastion" {
  type        = any
  default     = {}
  sensitive   = false
  description = "Cluster Bastion"
}

variable "servers" {
  type = map(object({
    role       = string
    name       = optional(string)
    type       = optional(string)
    image      = optional(number)
    subnet     = optional(string)
    network    = optional(number)
    location   = optional(string)
    datacenter = optional(string)
    firewalls  = optional(list(number), [])
    ssh_keys   = optional(list(string), [])
    labels     = optional(map(string), {})
  }))
  default     = {}
  sensitive   = false
  description = "Cluster Servers"
}

variable "firewalls" {
  type = map(object({
    name   = optional(string)
    labels = optional(map(string), {})

    inbounds = map(object({
      description = string
      source_ips  = list(string)
    }))
    outbounds = map(object({
      description     = string
      destination_ips = list(string)
    }))
  }))
  default     = {}
  sensitive   = false
  description = "Cluster Firewalls"
}

variable "load_balancers" {
  type = map(object({
    name      = optional(string)
    type      = optional(string)
    zone      = optional(string)
    subnet    = optional(string)
    network   = optional(number)
    location  = optional(string)
    algorithm = optional(string)
    labels    = optional(map(string), {})

    mapping = map(number)
  }))
  default     = {}
  sensitive   = false
  description = "Cluster Load Balancers"
}
