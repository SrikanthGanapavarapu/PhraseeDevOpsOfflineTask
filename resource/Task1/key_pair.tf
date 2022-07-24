#create key_par on AWS
resource "tls_private_key" "private_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create a .pem on your machine
resource "aws_key_pair" "key_pair" {
  key_name   = var.key_name
  public_key = tls_private_key.private_key.public_key_openssh

  provisioner "local-exec" {
    command = "echo '${tls_private_key.private_key.private_key_pem}' > ~/.ssh/${aws_key_pair.key_pair.key_name}.pem && chmod 400 ~/.ssh/${aws_key_pair.key_pair.key_name}.pem"
  }
}