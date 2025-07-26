# Terraform HCloud Cluster

![pipeline](https://github.com/ckoliber/terraform-hcloud-cluster/actions/workflows/ci.yml/badge.svg)
![release](https://img.shields.io/github/v/release/ckoliber/terraform-hcloud-cluster?display_name=tag)
![license](https://img.shields.io/github/license/ckoliber/terraform-hcloud-cluster)

General-purpose cluster provisioner for Hetzner Cloud, suitable for configuring workload managers like Swarm, Kubernetes, or Nomad, supporting groups of volumes, servers and load balancers.

## Installation

Add the required configurations to your terraform config file and install module using command bellow:

```bash
terraform init
```

## Usage

```hcl
module "cluster" {
  source = "ckoliber/cluster/hcloud"

  name        = "mycluster"
  public_key  = "<REDACTED>"
  private_key = "<REDACTED>"

  groups = {
    manager = {}
    worker  = {}
  }

  servers = {
    manager-1 = {
      type     = "cx22"
      image    = "ubuntu-24.04"
      location = "fsn1"
      groups   = ["manager"]
    }
    manager-2 = {
      type     = "cx22"
      image    = "ubuntu-24.04"
      location = "fsn1"
      groups   = ["manager"]
    }
    manager-3 = {
      type     = "cx22"
      image    = "ubuntu-24.04"
      location = "fsn1"
      groups   = ["manager"]
    }

    worker-1 = {
      type     = "cx52"
      image    = "ubuntu-24.04"
      location = "fsn1"
      groups   = ["worker"]
    }
    worker-2 = {
      type     = "cx52"
      image    = "ubuntu-24.04"
      location = "fsn1"
      groups   = ["worker"]
    }
    worker-3 = {
      type     = "cx52"
      image    = "ubuntu-24.04"
      location = "fsn1"
      groups   = ["worker"]
    }
    worker-4 = {
      type     = "cx52"
      image    = "ubuntu-24.04"
      location = "fsn1"
      groups   = ["worker"]
    }
    worker-5 = {
      type     = "cx52"
      image    = "ubuntu-24.04"
      location = "fsn1"
      groups   = ["worker"]
    }
  }

  balancers = {
    default = {
      type     = "lb11"
      location = "fsn1"
      mappings = ["tcp:80:80", "tcp:443:443"]
      groups   = ["manager", "worker"]
    }
  }
}
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

This project is licensed under the [MIT](LICENSE.md).  
Copyright (c) KoLiBer (koliberr136a1@gmail.com)
