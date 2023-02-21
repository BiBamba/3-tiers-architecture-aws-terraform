output "internal_lb_id" {
  description = "The Internal Load Balancer's ID"
  value = aws_lb.internal_lb.id
}

output "app_servers_asg_id" {
  description = "The App Servers Autoscalling Group's ID"
  value = aws_autoscaling_group.app_servers_asg.id
}