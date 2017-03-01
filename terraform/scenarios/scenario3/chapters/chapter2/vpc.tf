resource "aws_vpc" "vpc" {
  cidr_block = "${var.prefix_ip}.0/24"

  tags {
    Name = "aws-basic-study-${var.envname}"
  }
}
