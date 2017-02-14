resource "aws_internet_gateway" "vpc" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name = "aws-basic-study-${var.envname}-gateway"
  }
}
