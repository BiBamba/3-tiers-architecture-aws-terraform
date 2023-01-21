resource "aws_lb " "internal_lb" {
  name = var.internal_lb
  internal = true
  load_balancer_type = "network"
  subnets = ["aws_subnet.app-subnet01.id", "aws_subnet.app-subnet02.id"]
}