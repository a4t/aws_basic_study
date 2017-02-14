resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.vpc.id}"
  }

  tags {
    Name = "aws-basic-study-${var.envname}-public"
  }
}

resource "aws_route_table" "private" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name = "aws-basic-study-${var.envname}-private"
  }
}
