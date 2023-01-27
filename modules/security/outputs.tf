output "front_elb_sg_id" {
  description = "The ID of Internet facing Load Balancer's security group"
  value = aws_security_group.front_elb_sg.id
}

output "client_servers_sg_id" {
  description = "The ID of Client Server's security group"
  value = aws_security_group.client_servers_sg.id
}