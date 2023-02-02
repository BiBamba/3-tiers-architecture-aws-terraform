variable "vpc_cidr_block" {
    description = "This the CIDR Block of the VPC"
}

variable "private_subnet01_cidr_block" {
  description = "This is the CIDR Block of the private Subnet in zone 1 "
}

variable "private_subnet02_cidr_block" {
  description = "This is the CIDR Block of the private Subnet in zone 2 "
}

variable "public_subnet01_cidr_block" {
  description = "This is the CIDR Block of the public Subnet in zone 1 "
}

variable "public_subnet02_cidr_block" {
  description = "This is the CIDR Block of the public Subnet in zone 2 "
}