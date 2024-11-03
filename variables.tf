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

variable "public_key" {
  type        = string
  default     = ""
  sensitive   = false
  description = "Cluster Public Key"
}

variable "private_key" {
  type        = string
  default     = ""
  sensitive   = false
  description = "Cluster Private Key"
}

variable "servers" {
  type = map(object({
    name        = optional(string)
    type        = optional(string)
    image       = optional(number)
    subnet      = optional(string)
    network     = optional(number)
    has_network = optional(bool, false)
    location    = optional(string)
    datacenter  = optional(string)
    protection  = optional(bool)
    firewalls   = optional(list(number), [])
    ssh_keys    = optional(list(string), [])
    labels      = optional(map(string), {})
    groups      = optional(list(string), ["default"])

    volumes = optional(map(object({
      size      = number
      format    = optional(string)
      protected = optional(bool)
    })), {})
  }))
  default     = {}
  sensitive   = false
  description = "Cluster Servers"
}

variable "firewalls" {
  type = map(object({
    name   = optional(string)
    labels = optional(map(string), {})
    groups = optional(list(string), ["default"])

    inbounds = optional(map(object({
      description = string
      source_ips  = list(string)
    })), {})
    outbounds = optional(map(object({
      description     = string
      destination_ips = list(string)
    })), {})
  }))
  default     = {}
  sensitive   = false
  description = "Cluster Firewalls"
}

variable "load_balancers" {
  type = map(object({
    name        = optional(string)
    type        = optional(string)
    zone        = optional(string)
    subnet      = optional(string)
    network     = optional(number)
    has_network = optional(bool, false)
    location    = optional(string)
    algorithm   = optional(string)
    labels      = optional(map(string), {})
    groups      = optional(list(string), ["default"])

    mapping = map(number)
  }))
  default     = {}
  sensitive   = false
  description = "Cluster Load Balancers"
}
