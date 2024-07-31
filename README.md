# Terraform HCloud Cluster

![pipeline](https://github.com/cktf/terraform-hcloud-cluster/actions/workflows/cicd.yml/badge.svg)
![release](https://img.shields.io/github/v/release/cktf/terraform-hcloud-cluster?display_name=tag)
![license](https://img.shields.io/github/license/cktf/terraform-hcloud-cluster)

General purpose cluster provisioner on hetzner cloud, you can provision cluster of masters, cluster of workers, load-balancer, for configuring any kind of workload managers (Swarm, Kubernetes, Nomad, ...) on top of that.

## Installation

Add the required configurations to your terraform config file and install module using command bellow:

```bash
terraform init
```

## Usage

```hcl
module "cluster" {
  source = "cktf/cluster/hcloud"

  name = "mycluster"
  type = "k3s"

  agent_token  = "<REDACTED>"
  server_token = "<REDACTED>"

  public_key  = "<REDACTED>"
  private_key = "<REDACTED>"

  hcloud_zone    = "<ALB_ZONE>"
  hcloud_token   = "<HCLOUD_TOKEN>"
  hcloud_network = "<HCLOUD_NETWORK>"

  servers = {
    1 = {
      type     = "cx11"
      location = "fsn1"
    }
    2 = {
      type     = "cx11"
      location = "fsn1"
    }
    3 = {
      type     = "cx11"
      location = "fsn1"
    }
  }

  agents = {
    1 = {
      type     = "cx21"
      location = "fsn1"
    }
    2 = {
      type     = "cx21"
      location = "fsn1"
    }
  }

  pools = {
    1 = {
      type     = "cx21"
      location = "fsn1"
      min_size = 1
      max_size = 5
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
