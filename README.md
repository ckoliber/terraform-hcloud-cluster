# Terraform HCloud Cluster

![pipeline](https://github.com/cktf/terraform-hcloud-cluster/actions/workflows/cicd.yml/badge.svg)
![release](https://img.shields.io/github/v/release/cktf/terraform-hcloud-cluster?display_name=tag)
![license](https://img.shields.io/github/license/cktf/terraform-hcloud-cluster)

General purpose cluster provisioner on hetzner cloud, you can these kinds of resources for configuring any kind of workload managers (Swarm, Kubernetes, Nomad, ...) on top of that:

-   Group of servers
-   Firewall per groups
-   LoadBalancer per groups

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

  servers = {
    manager-1 = {
      type        = "cx22"
      groups      = ["manager"]
      network     = 12345
      has_network = true
    }
    manager-2 = {
      type        = "cx22"
      groups      = ["manager"]
      network     = 12345
      has_network = true
    }
    manager-3 = {
      type        = "cx22"
      groups      = ["manager"]
      network     = 12345
      has_network = true
    }

    worker-1 = {
      type        = "cx52"
      groups      = ["worker"]
      network     = 12345
      has_network = true
    }
    worker-2 = {
      type        = "cx52"
      groups      = ["worker"]
      network     = 12345
      has_network = true
    }
    worker-3 = {
      type        = "cx52"
      groups      = ["worker"]
      network     = 12345
      has_network = true
    }
    worker-4 = {
      type        = "cx52"
      groups      = ["worker"]
      network     = 12345
      has_network = true
    }
    worker-5 = {
      type        = "cx52"
      groups      = ["worker"]
      network     = 12345
      has_network = true
    }
  }

  firewalls = {
    manager = {
      groups = ["manager"]
      inbounds = {
        "80:tcp" = {
          description = "HTTP Inbound Traffic"
          source_ips  = ["0.0.0.0/0", "::/0"]
        }
        "443:tcp" = {
          description = "HTTPS Inbound Traffic"
          source_ips  = ["0.0.0.0/0", "::/0"]
        }
        "443:tcp" = {
          description = "HTTPS Inbound Traffic"
          source_ips  = ["0.0.0.0/0", "::/0"]
        }
      }
    }
    worker = {
      groups = ["worker"]
      inbounds = {
        "80:tcp" = {
          description = "HTTP Inbound Traffic"
          source_ips  = ["0.0.0.0/0", "::/0"]
        }
        "443:tcp" = {
          description = "HTTPS Inbound Traffic"
          source_ips  = ["0.0.0.0/0", "::/0"]
        }
      }
    }
  }

  load_balancers = {
    default = {
      groups      = ["manager", "worker"]
      network     = 12345
      has_network = true
      mapping = {
        80  = 80
        443 = 443
      }
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
