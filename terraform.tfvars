project_name = "netflix-devops"
environment  = "dev"
aws_region   = "us-east-1"

vpc_cidr = "10.0.0.0/16"

availability_zones = [
  "us-east-1a",
  "us-east-1b"
]

public_subnet_cidrs = [
  "10.0.1.0/24",
  "10.0.2.0/24"
]

private_subnet_cidrs = [
  "10.0.11.0/24",
  "10.0.12.0/24"
]

enable_nat_gateway = true

additional_tags = {
  Owner = "DevOps"
}

cluster_name = "netflix-eks"

kubernetes_version = "1.33"

node_instance_type = "t3.medium"

desired_size = 3

min_size = 2

max_size = 5
