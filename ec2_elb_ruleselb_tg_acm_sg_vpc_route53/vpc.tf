resource "aws_vpc" "vpc_name"{
    cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "subnet_name"{
    vpc_id = "${aws_vpc.vpc_name.id}"
    cidr_block = "10.0.0.0/24"

    tags = {
        name = "vpc_name"
    }
}