resource "aws_lb" "front-lb" {
  name = var.front-alb
  internal = false
  load_balancer_type = "application"
  security_groups = [aws_security_group.alb_sg.id]
  subnets = ["aws_subnet.web-subnet01.id", "aws_subnet.web-subnet02.id"]
  ip_address_type = "ip4"
}

resource "aws_lb " "internal_lb" {
  name = var.internal_lb
  internal = true
  load_balancer_type = "network"
  subnets = ["aws_subnet.app-subnet01.id", "aws_subnet.app-subnet02.id"]
}