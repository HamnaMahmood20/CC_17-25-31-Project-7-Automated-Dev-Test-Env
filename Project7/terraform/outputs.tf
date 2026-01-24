# This pulls the VPC ID from the network module to the root
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.network.vpc_id
}

output "public_subnet_id" {
  description = "The ID of the public subnet"
  value       = module.network.public_subnet_id
}

output "private_subnet_id" {
  description = "The ID of the private subnet"
  value       = module.network.private_subnet_id
}

output "proxy_security_group_id" {
  description = "The ID of the Proxy Security Group"
  value       = module.security.proxy_sg_id
}

output "web_security_group_id" {
  description = "The ID of the Web Security Group"
  value       = module.security.web_sg_id
}


output "proxy_dns_name" {
  value = module.compute.proxy_public_dns
}