resource "aws_lb" "front_lb" {
  name = var.front-lb
  internal = false
  load_balancer_type = "application"
  security_groups = [aws_security_group.alb_sg.id]
  subnets = ["aws_subnet.pub-subnet01.id", "aws_subnet.pub-subnet02.id"]
  ip_address_type = "ip4"
}

resource "aws_lb_target_group" "front_lb_tgrp" {
  name = var.front_lb_tgrp
  target_type = "alb"
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