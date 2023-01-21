resource "aws_vpc" "main" {
  cidr_block = var.vpc-cidr-block
}

resource "aws_network_acl" "netw-acl" {
  vpc_id = aws_vpc.main.id
}

resource "aws_subnet" "web-subnet01" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.web-subnet-cidr-block
}
resource "aws_subnet" "app-subnet02" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.app-subnet-cidr-block
}

resource "aws_subnet" "app-subnet01" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.app-subnet-cidr-block
}

resource "aws_subnet" "app-subnet02" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.app-subnet-cidr-block
}

