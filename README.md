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
      role    = "manager"
      type    = "cx22"
      network = 12345
    }
    manager-2 = {
      role    = "manager"
      type    = "cx22"
      network = 12345
    }
    manager-3 = {
      role    = "manager"
      type    = "cx22"
      network = 12345
    }

    worker-1 = {
      role    = "worker"
      type    = "cx52"
      network = 12345
    }
    worker-2 = {
      role    = "worker"
      type    = "cx52"
      network = 12345
    }
    worker-3 = {
      role    = "worker"
      type    = "cx52"
      network = 12345
    }
    worker-4 = {
      role    = "worker"
      type    = "cx52"
      network = 12345
    }
    worker-5 = {
      role    = "worker"
      type    = "cx52"
      network = 12345
    }
  }

  firewalls = {
    manager = {
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
      outbounds = {
        "icmp" = {
          description     = "ICMP Outbound Traffic"
          destination_ips = ["0.0.0.0/0", "::/0"]
        }
        "any:tcp" = {
          description     = "TCP Outbound Traffic"
          destination_ips = ["0.0.0.0/0", "::/0"]
        }
        "any:udp" = {
          description     = "UDP Outbound Traffic"
          destination_ips = ["0.0.0.0/0", "::/0"]
        }
      }
    }
    worker = {
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
      outbounds = {
        "icmp" = {
          description     = "ICMP Outbound Traffic"
          destination_ips = ["0.0.0.0/0", "::/0"]
        }
        "any:tcp" = {
          description     = "TCP Outbound Traffic"
          destination_ips = ["0.0.0.0/0", "::/0"]
        }
        "any:udp" = {
          description     = "UDP Outbound Traffic"
          destination_ips = ["0.0.0.0/0", "::/0"]
        }
      }
    }
  }

  load_balancers = {
    manager = {
      network = 12345
      mapping = {
        2377 = 2377
      }
    }
    worker = {
      network = 12345
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
