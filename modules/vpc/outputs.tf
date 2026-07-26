# ------------------------------------------------------------------------------
# VPC Outputs
# ------------------------------------------------------------------------------

output "vpc_id" {
  description = "The ID of the created VPC."
  value       = aws_vpc.main.id
}

output "vpc_cidr_block" {
  description = "The CIDR block assigned to the VPC."
  value       = aws_vpc.main.cidr_block
}

# ------------------------------------------------------------------------------
# Subnet Outputs
# ------------------------------------------------------------------------------

output "public_subnet_ids" {
  description = "List of IDs for the public subnets."
  value       = [aws_subnet.public_1.id, aws_subnet.public_2.id]
}

output "private_subnet_ids" {
  description = "List of IDs for the private subnets."
  value       = [aws_subnet.private_1.id, aws_subnet.private_2.id]
}

# ------------------------------------------------------------------------------
# Gateway & Routing Outputs
# ------------------------------------------------------------------------------

output "internet_gateway_id" {
  description = "The ID of the Internet Gateway attached to the VPC."
  value       = aws_internet_gateway.main.id
}

output "nat_gateway_ip" {
  description = "The public Elastic IP assigned to the NAT Gateway."
  value       = var.enable_nat_gateway ? aws_eip.nat[0].public_ip : null
}

output "public_route_table_id" {
  description = "The ID of the public route table."
  value       = aws_route_table.public.id
}

output "private_route_table_id" {
  description = "The ID of the private route table."
  value       = aws_route_table.private.id
}