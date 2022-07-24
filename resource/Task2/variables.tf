variable "vpc_cidr" {
  default = "192.168.0.0/16"
}
variable "public_subnet_cidr" {
  default = "192.168.0.0/24"
}
variable "private_subnet_cidr" {
  default = "192.168.1.0/24"
}

variable "key_name" {

}

variable "instance_type" {
  default = "t2.micro"
  
}

variable "aws_id" {
  default = "AKIAYVLSG3R736SQENHD"
}
variable "aws_key" {
  default = "qBPz5enHCBBilGML17zaD1WVfnHbzoRfU7y3MOl2"
}
variable "aws_region" {
  default = "us-east-1"
}

