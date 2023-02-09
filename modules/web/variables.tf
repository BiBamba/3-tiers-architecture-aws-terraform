variable "vpc_id" {}
variable "front_lb_name" {}
variable "front_lb_tgrp_name" {}
variable "image_id" {}
variable "instance_type" {}
variable "web_availabily_zones" {}
variable "web_desired_capacity" {}
variable "web_max_size" {}
variable "web_min_size" {}
variable "web_lt_name_prefix" {
  default = "web"
}
variable "front_elb_sg_id" {}
variable "client_servers_sg_id" {}
variable "public_subnet01_id" {}
variable "public_subnet02_id" {}