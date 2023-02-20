variable "internal_lb_name" {
  description = "The name of the Internal Load Balancer"
  default = "internal-load-balancer"
}

variable "app_launch_template_name" {
  description = "The name for the App Servers AutoScaling Group Launch template"
  default = "app-servers-launch-template"
}

variable "private_subnet01_id" {
  description = "The ID of the private subnet in availability zone 1"
}

variable "private_subnet02_id" {
  description = "The ID of the private subnet in availability zone 2"
}

variable "internal_lb_sg_id" {
  description = "The ID of the internal Load Balancer"
}

variable "internal_lb_targetgroup_name" {
  description = "The name of the internal Load Balancer's target group"
}

variable "vpc_id" {
  description = "The ID of the VPC"
}

variable "app_servers_image_id" {}
variable "app_servers_instance_type" {}
variable "app_availability_zones" {}
variable "app_servers_desired_capacity" {}
variable "app_servers_max_size" {}
variable "app_servers_min_size" {}