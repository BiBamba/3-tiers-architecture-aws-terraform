
variable "vpc_id" {}

variable "front_elb_sg_id" {}

variable "allowed_cidr_blocks" {
    default = ["0.0.0.0/0"]
}
variable "client_servers_sg" {
  default = "web_server_security_group"
}

variable "alb_sg_name" {
  default = "alb_security_group"
}