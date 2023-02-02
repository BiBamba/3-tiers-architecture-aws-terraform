variable "alb_name" {
  default = "test_alb"
}

variable "alb_tgrp_name" {
  default = "test_alb_target_group"
}

variable "image_id" {
  default = "ami-0aa7d40eeae50c9a9"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "availability_zones" {
  default = ["us-east-1a", "us-east-1b"]
}

variable "desired_number" {
  default = 2
}

variable "max_number" {
  default = 2
}

variable "min_number" {
  default = 1
}

#########################################################
#############              NETWORK
#########################################################

variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}

variable "private_subnet01_cidr_block" {
    default = "10.0.1.0/24"
}

variable "private_subnet02_cidr_block" {
    default = "10.0.2.0/24"
}

variable "public_subnet01_cidr_block" {
    default = "10.0.3.0/24"
}

variable "public_subnet02_cidr_block" {
    default = "10.0.4.0/24"
}