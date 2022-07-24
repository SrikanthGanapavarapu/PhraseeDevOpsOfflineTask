# Creating security group for Bastion Host/Jump Box
resource "aws_security_group" "ssh_sg" {

  depends_on = [
    aws_vpc.main,
    aws_subnet.public_subnet,
    aws_subnet.private_subnet
  ]

  name   = "ssh_sg"
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Creating security group for private instance Bastion Host Access
resource "aws_security_group" "private_instance_bastion_ssh_sg" {

  depends_on = [
    aws_vpc.main,
    aws_subnet.public_subnet,
    aws_subnet.private_subnet,
    aws_security_group.ssh_sg
  ]

  name   = "private_instance_bastion_sg"
  vpc_id = aws_vpc.main.id

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.ssh_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

