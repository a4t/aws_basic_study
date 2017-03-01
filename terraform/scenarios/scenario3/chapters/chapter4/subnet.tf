resource "aws_subnet" "public" {
  vpc_id     = "${aws_vpc.vpc.id}"
  cidr_block = "${var.prefix_ip}.0/27"
  availability_zone = "${var.availability_zone}"

  tags {
    Name = "aws-basic-study-${var.envname}-public"
  }
}
