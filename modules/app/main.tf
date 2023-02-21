resource "aws_lb" "internal_lb" {
  name = var.internal_lb_name
  internal = true
  load_balancer_type = "application"
  security_groups = [var.internal_lb_sg_id]
  subnets = ["var.private_subnet01_id", "var.private_subnet02_id"]
  ip_address_type = "ipv4"
}

resource "aws_lb_target_group" "internal_lb_targetgroup" {
  name = var.internal_lb_targetgroup_name
  target_type = "instance"
  port = "80"
  protocol = "HTTP"
  vpc_id = var.vpc_id
}

resource "aws_lb_listener" "internal_lb_listener" {
  load_balancer_arn = aws_lb.internal_lb.arn
  port = 80
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.internal_lb_targetgroup.arn
  }
}

resource "aws_launch_template" "app_servers_launch_template" {
  name = var.app_launch_template_name
  image_id = var.app_servers_image_id
  instance_type = var.app_servers_instance_type
  vpc_security_group_ids = ["${var.app_launch_template_sg_id}"]
}

resource "aws_autoscaling_group" "app_servers_asg" {
  //availability_zones = var.app_availability_zones
  desired_capacity = var.app_servers_desired_capacity
  max_size = var.app_servers_max_size
  min_size = var.app_servers_min_size

  launch_template {
    id = aws_launch_template.app_servers_launch_template.id
    version = "$Latest"
  }

  target_group_arns = ["aws_lb_target_group.internal_lb.arn"]
}