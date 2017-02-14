resource "aws_security_group" "app" {
  name        = "aws-basic-study-${var.envname}-app"
  vpc_id = "${aws_vpc.vpc.id}"
  description = "aws-basic-study-${var.envname} app"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name    = "aws-basic-study-${var.envname}-app"
  }
}

resource "aws_security_group" "developer" {
  name        = "aws-basic-study-${var.envname}-developer"
  vpc_id = "${aws_vpc.vpc.id}"
  description = "aws-basic-study-${var.envname} developer"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    cidr_blocks     = ["${var.developer_ip}"]
  }

  tags {
    Name    = "aws-basic-study-${var.envname}-developer"
  }
}

resource "aws_security_group" "private" {
  name        = "aws-basic-study-${var.envname}-private"
  vpc_id = "${aws_vpc.vpc.id}"
  description = "aws-basic-study-${var.envname} private"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = ["${aws_security_group.app.id}"]
  }

  tags {
    Name    = "aws-basic-study-${var.envname}-private"
  }
}
