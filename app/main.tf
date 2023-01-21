resource "aws_lb " "internal_lb" {
  name = var.internal_lb
  internal = true
  load_balancer_type = "network"
  subnets = ["aws_subnet.app-subnet01.id", "aws_subnet.app-subnet02.id"]
}

resource "aws_launch_template" "app_lt" {
  name_prefix = var.app_lt_name_prefix
  image_id = var.app_image_id
  instance_type = var.app_instance_type
}

resource "aws_autoscaling_group" "app_asg" {
  availability_zones = var.app_availability_zones
  desired_capacity = var.app_desired_capacity
  max_size = var.app_max_size
  min_size = var.app_min_size

  launch_template {
    id = aws_launch_template.app_lt.id
    version = "$Latest"
  }
}