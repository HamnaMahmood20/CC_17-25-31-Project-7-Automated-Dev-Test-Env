# Security Group for Nginx Proxy
resource "aws_security_group" "sg_proxy" {
  name        = "${var.environment}-sg-proxy"
  vpc_id      = var.vpc_id

  # Allow HTTP
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow SSH from your IP
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Project     = "Project7"
    Environment = var.environment
    Role        = "Proxy"
    Stack       = "Nginx"
  }
}

# Security Group for Web Servers (Apache/Nginx)
resource "aws_security_group" "sg_web" {
  name        = "${var.environment}-sg-web"
  vpc_id      = var.vpc_id

  # Allow HTTP ONLY from Proxy Security Group
  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.sg_proxy.id]
  }

  # Allow SSH
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Project     = "Project7"
    Environment = var.environment
    Role        = "Web"
    Stack       = "LAMP/LEMP"
  }
}