resource "aws_instance" "private-a" {
  ami                         = "ami-eb49358c"
  instance_type               = "t2.nano"
  key_name                    = "${var.key_name}"
  associate_public_ip_address = 0
  subnet_id                   = "${aws_subnet.private-a.id}"
  vpc_security_group_ids      = [
    "${aws_security_group.private.id}"
  ]

  root_block_device = {
    volume_type = "gp2"
    volume_size = "8"
  }

  tags {
    Name = "aws-basic-study-${var.envname}-private-a"
  }
}

resource "aws_instance" "private-c" {
  ami                         = "ami-eb49358c"
  instance_type               = "t2.nano"
  key_name                    = "${var.key_name}"
  associate_public_ip_address = 0
  subnet_id                   = "${aws_subnet.private-c.id}"
  vpc_security_group_ids      = [
    "${aws_security_group.private.id}"
  ]

  root_block_device = {
    volume_type = "gp2"
    volume_size = "8"
  }

  tags {
    Name = "aws-basic-study-${var.envname}-private-c"
  }
}
