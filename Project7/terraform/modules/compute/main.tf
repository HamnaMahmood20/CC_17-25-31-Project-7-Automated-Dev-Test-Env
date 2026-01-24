# 1. Nginx Proxy/Dev Gateway (Public Subnet)
resource "aws_instance" "proxy" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.public_subnet_id
  vpc_security_group_ids = [var.proxy_sg_id]

  tags = {
    Name        = "${var.environment}-proxy"
    Project     = "Project7-Automated-DevTest"
    Environment = var.environment
    Role        = "proxy"
    Stack       = "proxy"
  }
}

# 2. Apache Web instance (Private or Public depending on your architecture)
resource "aws_instance" "apache_web" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.private_subnet_id
  vpc_security_group_ids = [var.web_sg_id]

  tags = {
    Name        = "${var.environment}-apache-web"
    Project     = "Project7-Automated-DevTest"
    Environment = var.environment
    Role        = "web"
    Stack       = "apache"
  }
}

# 3. Nginx+PHP-FPM Web instance
resource "aws_instance" "nginx_web" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.private_subnet_id
  vpc_security_group_ids = [var.web_sg_id]

  tags = {
    Name        = "${var.environment}-nginx-web"
    Project     = "Project7-Automated-DevTest"
    Environment = var.environment
    Role        = "web"
    Stack       = "nginx-phpfpm"
  }
}