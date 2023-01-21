resource "aws_lb" "front-lb" {
  name = var.front-alb
  internal = false
  load_balancer_type = "application"
  security_groups = [aws_security_group.alb_sg.id]
  subnets = ["aws_subnet.web-subnet01.id", "aws_subnet.web-subnet02.id"]
  ip_address_type = "ip4"
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
}
