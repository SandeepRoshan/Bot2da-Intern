# Define the AWS provider and specify the region
provider "aws" {
  region = var.region
}

resource "aws_vpc" "example_vpc" {
  cidr_block = var.cidr_block

  tags = {
    Name = "example_vpc"
  }
}

# Create a security group to manage access control
resource "aws_security_group" "example_security_group" {
  name        = "example-security-group"
  vpc_id      = aws_vpc.example_vpc.id
  description = "Security group for blocking public access from outside"

  ingress {
    description = "Allow HTTP traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.cidr_blocks
  }

  ingress {
    description = "Allow HTTPS traffic"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.cidr_blocks
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.cidr_blocks
  }

  tags = {
    Name = "example-security-group"
  }
}

# Subnet
resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.example_vpc.id
  cidr_block        = var.cidr_block
  availability_zone = var.availability_zone

  tags = {
    Name = "private_subnet"
  }
}

# Create an EC2 Instance
resource "aws_instance" "example" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  availability_zone      = var.availability_zone
  subnet_id              = aws_subnet.private_subnet.id
  vpc_security_group_ids = [aws_security_group.example_security_group.id]

  tags = {
    Name = "example-instance"
  }

  associate_public_ip_address = false

  root_block_device {
    volume_size = 8
  }

  lifecycle {
    create_before_destroy = true
  }
}
