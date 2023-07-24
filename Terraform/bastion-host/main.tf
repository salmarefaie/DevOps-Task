# basion host 
resource "aws_instance" "public-ec2" {
  ami                         = var.ami
  instance_type               = var.ec2_type
  subnet_id                   = var.subnet_id
  associate_public_ip_address = var.enable_publicIP
  vpc_security_group_ids      = [aws_security_group.sg.id]
  key_name                    = var.key_name

  tags = {
    Name = var.ec2_name
  }
}

# security group for basion host
resource "aws_security_group" "sg" {
  name        = var.security_group
  description = var.security_group
  vpc_id      = var.vpc_id

  ingress {
    description = "http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.public_cidr]
  }

  ingress {
    description = "ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.public_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.public_cidr]
  }

  tags = {
    Name = var.security_group
  }
}