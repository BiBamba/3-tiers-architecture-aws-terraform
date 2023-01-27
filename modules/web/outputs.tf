output "front_lb_id" {
  description = "The ID of the Internet Facing load Balancer"
  value = aws_lb.front_lb.id
}


