resource "aws_instance" "public-a" {
  ami                         = "ami-eb49358c"
  instance_type               = "t2.nano"
  key_name                    = "${var.key_name}"
  associate_public_ip_address = 1
  subnet_id                   = "${aws_subnet.public-a.id}"
  vpc_security_group_ids      = [
    "${aws_security_group.app.id}",
    "${aws_security_group.developer.id}"
  ]

  root_block_device = {
    volume_type = "gp2"
    volume_size = "8"
  }

  tags {
    Name = "aws-basic-study-${var.envname}-public-a"
  }
}

resource "aws_instance" "public-c" {
  ami                         = "ami-eb49358c"
  instance_type               = "t2.nano"
  key_name                    = "${var.key_name}"
  associate_public_ip_address = 1
  subnet_id                   = "${aws_subnet.public-c.id}"
  vpc_security_group_ids      = [
    "${aws_security_group.app.id}",
    "${aws_security_group.developer.id}"
  ]

  root_block_device = {
    volume_type = "gp2"
    volume_size = "8"
  }

  tags {
    Name = "aws-basic-study-${var.envname}-public-c"
  }
}
