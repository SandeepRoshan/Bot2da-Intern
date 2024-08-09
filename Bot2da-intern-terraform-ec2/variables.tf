# Define the AWS region for resource creation
variable "region" {
  description = "The AWS region to create resources in"
  type        = string
  default     = "ap-south-1"
  
}

# Define the VPC ID where the resources will be Created
variable "vpc_id" {
  description = "The VPC ID where resources will be created"
  type        = string
  default     = ""
}

# Define the AMI ID to use for the EC2 instance
variable "ami_id" {
  description = "The ID of the AMI to use for the EC2 instance"
  type        = string
  default     = "ami-0a4408457f9a03be3"
}

# Define the instance type for the EC2 instance
variable "instance_type" {
  description = "The instance type to use for the EC2 instance"
  type        = string
  default     = "t2.micro"
}

# Define the availability zone to launch the instance in
variable "availability_zone" {
  description = "The availability zone to launch the instance in"
  type        = string
  default     = "ap-south-1a"
}

# Define the subnet where the EC2 instance placed
variable "subnet_id" {
  description = "The ID of the subnet where the EC2 instance will be launched."
  type        = string
  default     = ""
}

# Define the CIDR block for IP routing and a custom network id
variable "cidr_block" {
  description = "Custom Classless Inter Domain Routing Block"
  type        = string
  default     = "10.0.0.0/16"
}

# Define the CIDR for allow all the IP's
variable "cidr_blocks" {
  description = "A list of CIDR blocks"
  type        = list(string)
  default     = ["10.0.0.0/16", "192.168.0.0/24"]
}
