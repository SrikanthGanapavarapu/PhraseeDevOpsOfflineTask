# Create Ec2 Instance in the private subnet!
resource "aws_instance" "private_instance" {

  depends_on = [
    aws_vpc.main,
    aws_security_group.ssh_sg,
    aws_security_group.private_instance_bastion_ssh_sg
  ]

  ami                    = data.aws_ami.aws_linux_2_latest.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.private_subnet.id
  key_name               = aws_key_pair.key_pair.id
  vpc_security_group_ids = [aws_security_group.private_instance_bastion_ssh_sg.id]

  tags = {
    Name = "private_instance"
  }
}

# Create Bastion Host in the public Subnet!
resource "aws_instance" "bastion_host" {

  depends_on = [
    aws_instance.private_instance
  ]

  ami                    = data.aws_ami.aws_linux_2_latest.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public_subnet.id
  key_name               = aws_key_pair.key_pair.id
  vpc_security_group_ids = [aws_security_group.ssh_sg.id]

  tags = {
    Name = "bastion_host"
  }

}

