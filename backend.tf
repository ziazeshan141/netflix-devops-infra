terraform {
  backend "s3" {
    bucket       = "netflix-devops-s3-state-047385030300-us-east-1-an"
    key          = "dev/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true # Enables native S3 locking without DynamoDB
  }
}