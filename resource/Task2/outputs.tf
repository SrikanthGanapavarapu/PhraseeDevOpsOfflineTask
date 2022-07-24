output "private_ec2_ip" {
  value = aws_instance.private_instance.private_ip
}

output "bastion_host" {
  value = aws_instance.bastion_host.public_ip
}