variable "vpc-cidr-block" {
    description = "This the CIDR Block of the VPC"
}

variable "web-subnet-cidr-block" {
  description = "This is the CIDR Block of the Subnet for the Web layer "
}

variable "app-subnet-cidr-block" {
  description = "This is the CIDR Block of the Subnet for the App layer "
}