# Output the ID of the EC2 instance
output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.example.id
}

# Output the public IP address of the EC2 instance (should be none)
output "public_ip" {
  description = "The public IP address of the EC2 instance (should be none)"
  value       = aws_instance.example.public_ip
}

# Output the private IP address of the EC2 instance
output "private_ip" {
  description = "The private IP address of the EC2 instance"
  value       = aws_instance.example.private_ip
}


