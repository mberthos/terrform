resource "aws_instance" "app" {
  ami           = "${var.ami}"
  instance_type = "${var.instance_type}"
  security_groups = ["${aws_security_group.instance_sg.id}"]
  subnet_id      = "${var.subnets}"
  tags = {
    Name = "=D"
  }
}