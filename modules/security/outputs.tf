output "front_elb_sg_id" {
  description = "The ID of Internet facing Load Balancer's security group"
  value = aws_security_group.front_elb_sg.id
}

output "client_servers_sg_id" {
  description = "The ID of Client Server's security group"
  value = aws_security_group.client_servers_sg.id
}

output "inernal_lb_sg_id" {
  description = "The ID of the Internal Load Balancer's security Group"
  value = aws_security_group.inernal_lb_sg.id
}

output "app_launch_template_sg_id" {
  description = "The ID of the security Group for the App Servers Launch Template"
  value = aws_security_group.app_launch_template_sg.id
}