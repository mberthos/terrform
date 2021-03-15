resource "aws_lb_listener_rule" "lb_listener_rule_http" {
  listener_arn = "${aws_lb_listener.lb_listener_http.arn}"
  priority     = 1

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.tg_name.arn}"
  }

  condition {
    host_header {
      values = ["${var.endpoint}"]
    }
  }
}

resource "aws_lb_listener_rule" "lb_listener_rule_https" {
  listener_arn = "${aws_lb_listener.lb_listener_https.arn}"
  priority     = 1

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.tg_name.arn}"
  }

  condition {
    host_header {
      values = ["${var.endpoint}"]
    }
  }
}