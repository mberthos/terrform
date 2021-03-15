resource "aws_security_group" "lb_sg" {
  name        = "sg-lb"
  description = "load balancer access control"
  vpc_id      = "${aws_vpc.vpc_name.id}"

  ingress {
    description = "allow http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "allow https"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_http/s"
  }
}

resource "aws_security_group" "instance_sg" {
  name        = "sg-instance"
  description = "instance access control"
  vpc_id      = "${aws_vpc.vpc_name.id}"

  ingress {
    description = "allow lb"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    security_groups = ["${aws_security_group.lb_sg.id}"]
  }

  ingress {
    description = "allow access restrict"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["${var.allow_ip}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_http/s"
  }
}