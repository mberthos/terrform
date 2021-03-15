provider "aws" {
    region  = "${var.region}"
    profile = "${var.profile}"
    version = "${var.version}"
}