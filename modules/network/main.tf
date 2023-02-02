resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block
}

/*
resource "aws_network_acl" "netw-acl" {
  vpc_id = aws_vpc.main.id
}
*/

resource "aws_subnet" "private_subnet01" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.private_subnet01_cidr_block
}
resource "aws_subnet" "private_subnet02" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.private_subnet02_cidr_block
}

resource "aws_subnet" "public_subnet01" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.public_subnet01_cidr_block
  map_public_ip_on_launch = true
}

resource "aws_subnet" "public_subnet02" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.public_subnet02_cidr_block
  map_public_ip_on_launch = true
}

