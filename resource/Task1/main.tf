resource "aws_instance" "ec2_public" {

  depends_on = [
    aws_s3_object.object
  ]
  ami                    = data.aws_ami.aws_linux_2_latest.id
  key_name               = aws_key_pair.key_pair.key_name
  instance_type          = var.instance_type
  iam_instance_profile   = aws_iam_instance_profile.example_profile.id
  vpc_security_group_ids = [aws_security_group.ec2_public_sg.id]

  subnet_id = data.aws_subnets.default_subnets.ids[0]
  user_data = data.template_file.init.rendered

  tags = {
    Name = "public_ec2"
  }


}