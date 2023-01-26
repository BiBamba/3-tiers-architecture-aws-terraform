resource "aws_route53_record" "front_lb" {
  zone_id ="${""}"
  name = "${var.route53_hosted_zone_name}"
  type = "A"
  alias {
    name = aws_lb.front_lb.dns_name
    zone_id = aws_lb.front_lb.zone_id
    evaluate_target_health = true
  }
}