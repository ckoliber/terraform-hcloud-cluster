resource "tls_private_key" "this" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "hcloud_ssh_key" "this" {
  count = var.has_ssh_key ? 0 : 1

  name       = var.name
  public_key = tls_private_key.this.public_key_openssh
}

locals {
  ssh_key = try(hcloud_ssh_key.this[0].id, var.ssh_key)
}
