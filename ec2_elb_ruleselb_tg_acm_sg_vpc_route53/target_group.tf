resource "aws_lb_target_group" "tg_name"{
    name = "tg-name"
    port = 80
    protocol = "HTTP"
    vpc_id = "${aws_vpc.vpc_name.id}"
    target_type = "instance"
    health_check{
        path = "/"
        healthy_threshold = 2
        unhealthy_threshold = 2
        timeout = 5
        interval = 10
    }
}

resource "aws_lb_target_group_attachment" "tg_attach_name" {
  target_group_arn = "${aws_lb_target_group.tg_name.arn}"
  target_id        = "${aws_instance.app.id}"
  port             = 80
}