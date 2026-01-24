variable "vpc_id" {
  type        = string
  description = "VPC ID from the network module"
}

variable "environment" {
  type        = string
  description = "Environment name (dev, qa, uat)"
}

variable "my_ip" {
  type        = string
  description = "Your public IP for SSH access S"
  default     = "0.0.0.0/0" # Change this to your specific IP for better security
}