resource "aws_lb" "elb_name" {
    name = "elb-name"
    load_balancer_type = "application"
    security_groups = ["${aws_security_group.lb_sg.id}"]
    subnets = ["${aws_subnet.subnet_name.id}"]
    idle_timeout = 120
    tags = {
        tag1 = "tag1"
        tag2 = "tag2"
    }
}

resource "aws_lb_listener" "lb_listener_http"{
    load_balancer_arn = "${aws_lb.elb_name.arn}"
    port = "80"
    protocol = "HTTP"

    default_action{
        type = "forward"
        target_group_arn = "${aws_lb_target_group.tg_name.arn}"
    }
}

resource "aws_lb_listener" "lb_listener_https"{
    load_balancer_arn = "${aws_lb.elb_name.arn}"
    port = "443"
    protocol = "HTTPS"
    ssl_policy = "ELBSecurityPolicy-2021-03"
    certificate_arn = "${aws_acm_certificate.cert.arn}"

    default_action{
        type = "forward"
        target_group_arn = "${aws_lb_target_group.tg_name.arn}"
    }
}

output lb_output_elb_name {
  value       = "${aws_lb.elb_name.name}"
  sensitive   = true
  description = "description"
  depends_on  = []
}
output lb_output_listener_http {
  value       = "${aws_lb_listener.lb_listener_http.arn}"
  sensitive   = true
  description = "description"
  depends_on  = []
}

output lb_output_listener_https {
  value       = "${aws_lb_listener.lb_listener_https.arn}"
  sensitive   = true
  description = "description"
  depends_on  = []
}