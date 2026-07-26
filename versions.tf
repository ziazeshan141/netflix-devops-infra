terraform {
  # Minimum version of Terraform CLI required
  required_version = ">= 1.7.0"

  # Define required provider plugins
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.100.0" # Pins major version 5.x while allowing minor updates
    }
  }
}