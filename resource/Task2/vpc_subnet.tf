# Creating a VPC!
resource "aws_vpc" "main" {

  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name = "user_vpc"
  }
}

# Creating Public subnet
resource "aws_subnet" "public_subnet" {

  depends_on = [
    aws_vpc.main
  ]

  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = data.aws_availability_zones.available.names[1]
  map_public_ip_on_launch = true

  tags = {
    Name = "Public Subnet"
  }
}

# Creating Public subnet
resource "aws_subnet" "private_subnet" {

  depends_on = [
    aws_vpc.main,
    aws_subnet.public_subnet
  ]

  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidr
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "Private Subnet"
  }
}

# Creating an Internet Gateway for the VPC
resource "aws_internet_gateway" "internet_gateway" {

  depends_on = [
    aws_vpc.main,
    aws_subnet.public_subnet,
    aws_subnet.private_subnet
  ]

  # VPC in which it has to be created!
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "InternetGateway"
  }
}


# Creating Route Table for the public subnet!
resource "aws_route_table" "public_subnet_route_table" {
  depends_on = [
    aws_vpc.main,
    aws_internet_gateway.internet_gateway
  ]

  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name = "Route Table for Internet Gateway"
  }
}


# Creating Route Table Association!
resource "aws_route_table_association" "route_table_association" {

  depends_on = [
    aws_vpc.main,
    aws_subnet.public_subnet,
    aws_subnet.private_subnet,
    aws_route_table.public_subnet_route_table
  ]

  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_subnet_route_table.id
}
