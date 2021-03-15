resource "aws_acm_certificate" "cert" {
  domain_name       = "${var.domain_name}"
  validation_method = "DNS"
}

data "aws_route53_zone" "zone_name" {
  name         = "${var.domain_name}"
  private_zone = false
}

resource "aws_route53_record" "cert_validation" {
  name   = "${aws_acm_certificate.cert.domain_validation_options.0.resource_record_name}"
  records = ["${aws_acm_certificate.cert.domain_validation_options.0.resource_record_value}"]
  type   = "${aws_acm_certificate.cert.domain_validation_options.0.resource_record_type}"
  zone_id = "${data.aws_route53_zone.zone_name.id}"
  ttl = 60
}

resource "aws_acm_certificate_validation" "cert" {
  certificate_arn         = "${aws_acm_certificate.cert.arn}"
  validation_record_fqdns = ["${aws_route53_record.cert_validation.fqdn}"]
}