resource "aws_subnet" "public-a" {
  vpc_id     = "${aws_vpc.vpc.id}"
  cidr_block = "${var.prefix_ip}.0/28"
  availability_zone = "${var.availability_zone[0]}"

  tags {
    Name = "aws-basic-study-${var.envname}-public-a"
  }
}

resource "aws_subnet" "public-c" {
  vpc_id     = "${aws_vpc.vpc.id}"
  cidr_block = "${var.prefix_ip}.16/28"
  availability_zone = "${var.availability_zone[1]}"

  tags {
    Name = "aws-basic-study-${var.envname}-public-c"
  }
}

resource "aws_subnet" "private-a" {
  vpc_id     = "${aws_vpc.vpc.id}"
  cidr_block = "${var.prefix_ip}.32/28"
  availability_zone = "${var.availability_zone[0]}"

  tags {
    Name = "aws-basic-study-${var.envname}-private-a"
  }
}

resource "aws_subnet" "private-c" {
  vpc_id     = "${aws_vpc.vpc.id}"
  cidr_block = "${var.prefix_ip}.48/28"
  availability_zone = "${var.availability_zone[1]}"

  tags {
    Name = "aws-basic-study-${var.envname}-private-c"
  }
}
