resource "aws_instance" "app" {
  ami           = "${var.ami}"
  instance_type = "${var.instance_type}"
  security_groups = ["${aws_security_group.instance_sg.id}"]
  #vpc_id      = "${aws_vpc.vpc_name.id}"
  tags = {
    Name = "=D"
  }
}