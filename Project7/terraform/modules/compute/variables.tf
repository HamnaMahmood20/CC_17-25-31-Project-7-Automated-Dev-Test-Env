variable "public_subnet_id" { type = string }
variable "private_subnet_id" { type = string }
variable "proxy_sg_id" { type = string }
variable "web_sg_id" { type = string }
variable "environment" { type = string }
variable "ami_id" { 
  type    = string
  default = "ami-06a8303596865117b"
}
variable "instance_type" { 
  type    = string
  default = "t2.micro" 
}