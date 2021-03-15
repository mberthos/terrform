resource "aws_route53_record" "www" {
  zone_id = "${aws_route53_zone.zone_name.zone_id}"
  name    = "${var.endpoint}"
  type    = "CNAME"
  ttl     = "300"
  
  weighted_routing_policy {
    weight = 10
  }
  records = ["${aws_lb.elb_name.dns_name}"]
}