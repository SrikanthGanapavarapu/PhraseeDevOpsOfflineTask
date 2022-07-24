module "task2" {
  source = "../resource/Task2/"

  aws_id     = ""   ##Add aws_id
  aws_key    = ""   ##Add aws_key
  aws_region = ""   ##Add aws_region

  instance_type = "t2.small"   ##Instance_type
  key_name      = "module2"    ##Aws key_pair name

  vpc_cidr            = "192.168.0.0/16"	#VPC CIDR
  public_subnet_cidr  = "192.168.0.0/24"	#Publlic Subnet CIDR
  private_subnet_cidr = "192.168.1.0/24"	#Private Subnet CIDR
}
