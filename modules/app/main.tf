resource "aws_lb" "internal_lb" {
  name = var.internal_lb
  internal = true
  load_balancer_type = "network"
  subnets = ["aws_subnet.private-subnet01.id", "aws_subnet.pribate-subnet02.id"]
  ip_address_type = "ip4"
}

resource "aws_lb_target_group" "front_lb_tgrp" {
  name = var.front_lb_tgrp
  target_type = "instance"
  port = "80"
  protocol = "HTTP"
  vpc_id = aws_vpc.main.id
}

resource "aws_lb_listener " "front_lb_listener" {
  load_balancer_arn = aws_lb.front_lb.arn
  port = 80
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.front_lb_tgrp.arn
  }
}

resource "aws_launch_template" "web_lt" {
  name_prefix = var.web_lt_name_prefix
  image_id = var.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = ["${var.web_lt_sg}"]
}

resource "aws_autoscaling_group" "web_asg" {
  availability_zones = var.web_availabily_zones
  desired_capacity = var.web_desired_capacity
  max_size = var.web_max_size
  min_size = var.web_min_size

  launch_template {
    id = aws_launch_template.web_lt.id
    version = "$Latest"
  }

  target_group_arns = ["aws_lb_target_group.front_lb_tgrp.arn"]
}