resource "aws_security_group" "alb_sg" {
  name = var.alb_name
  vpc_id = aws_vpc.main.id

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