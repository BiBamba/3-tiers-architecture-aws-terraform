module "network" {
  source = "../../modules/network"
}

resource "aws_security_group" "front_elb_sg" {
  name = var.alb_sg_name
  vpc_id = main_vpc_id

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
  vpc_id = main_vpc_id

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    security_groups = [ "front_elb_sg_id" ]
  }
}

