resource "aws_security_group" "front_elb_sg" {
  name = var.alb_sg_name
  vpc_id = var.vpc_id

  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = "${var.allowed_cidr_blocks}"
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = "${var.allowed_cidr_blocks}"
  }
}

resource "aws_security_group" "client_servers_sg" {
  name = var.client_servers_sg
  vpc_id = var.vpc_id

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    security_groups = ["aws_security_group.front_elb_sg.id"]
  }
}

resource "aws_security_group" "inernal_lb_sg" {
  name = var.internal_lb_sg
  description = "balance load from frontend to backend servers"
  vpc_id = var.vpc_id

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    security_groups = ["aws_security_group.client_servers_sg.id"]
  }
}

