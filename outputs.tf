output "instance_id" {
  value = aws_instance.create-ec2-rancher.id
}

output "instance_private_ip" {
  value = aws_instance.create-ec2-rancher.private_ip
}

output "instance_public_ip" {
  value = aws_instance.create-ec2-rancher.public_ip
}
