output "proxy_public_ip" {
  value = aws_instance.proxy.public_ip
}

output "apache_private_ip" {
  value = aws_instance.apache_web.private_ip
}

output "nginx_private_ip" {
  value = aws_instance.nginx_web.private_ip
}


# Inside terraform/modules/compute/outputs.tf
output "proxy_public_dns" {
  value = aws_instance.proxy.public_dns
}