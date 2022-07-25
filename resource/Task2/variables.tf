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
}
variable "aws_key" {
}
variable "aws_region" 
}

