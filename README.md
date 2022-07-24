# PhraseeDevOpsOfflineTask

#Module 1: 

1. Creation of S3 bucket and upload index.html file
2. Launch EC2 Instance in Public subnet and launch Nginx Docker image 
3. IAM Policy & Assure Role to access S3 & Cloudwatch from EC2 Instance 
4. Create Cloudwatch Dashboard and Logs

##Usage

module "task1" {
  source = "../resource/Task1/"

  aws_id     = ""   ## Add aws_id
  aws_key    = ""   ## Add aws_key
  aws_region = ""   ## Add aws_region

  instance_type  = "t2.small"			## Instance Type
  key_name       = "module1"			## aws key_pair name
  s3_bucket_name = "phrasee-module1-bkt"	## s3_bucket_name

}

#Module 2:

1. Create VPC, Subnet, Internet Gateway, Route Table, Security Groups
2. Launch Bastion Host in Public Subnet
3. Launch Private EC2 instance and ssh only from Bastion 

##Usage:

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
