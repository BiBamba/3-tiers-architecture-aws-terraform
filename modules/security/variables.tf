
variable "vpc_id" {}

variable "front_elb_sg_id" {}

#############################################################################
###################        OPTIONAL VARIABLES       #########################
#############################################################################

variable "allowed_cidr_blocks" {
    default = ["0.0.0.0/0"]
}
variable "client_servers_sg" {
  default = "web-server-security-group"
}

variable "alb_sg_name" {
  default = "alb-security-group"
}

variable "app_launch_template_sg_name" {
  description = "The name of the security Group for the App Servers Launch Template"
  default = "app-launch-template-sg"
}

variable "internal_lb_sg_name" {
  description = "The name of the security Group for the Internal Load Balancer"
  default = "internal_lb_sg"
}