# -------------------------
# VPC Outputs
# -------------------------

output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "Public subnet IDs"
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "Private subnet IDs"
  value       = module.vpc.private_subnet_ids
}

# -------------------------
# IAM Outputs
# -------------------------

output "cluster_role_arn" {
  description = "EKS Cluster IAM Role ARN"
  value       = module.iam.cluster_role_arn
}

output "node_role_arn" {
  description = "EKS Node IAM Role ARN"
  value       = module.iam.node_role_arn
}

# -------------------------
# Security Group Outputs
# -------------------------

output "cluster_security_group_id" {
  description = "EKS Cluster Security Group ID"
  value       = module.security_groups.cluster_security_group_id
}

output "node_security_group_id" {
  description = "Worker Node Security Group ID"
  value       = module.security_groups.node_security_group_id
}

# -------------------------
# ECR Outputs
# -------------------------

output "frontend_repository_url" {
  description = "Frontend ECR Repository URL"
  value       = module.ecr.frontend_repository_url
}

output "backend_repository_url" {
  description = "Backend ECR Repository URL"
  value       = module.ecr.backend_repository_url
}

# -------------------------
# EKS Outputs
# -------------------------

output "cluster_name" {
  description = "EKS Cluster Name"
  value       = module.eks.cluster_name
}

output "cluster_endpoint" {
  description = "EKS Cluster Endpoint"
  value       = module.eks.cluster_endpoint
}

output "cluster_certificate_authority_data" {
  description = "EKS Cluster CA Certificate"
  value       = module.eks.cluster_certificate_authority_data
}