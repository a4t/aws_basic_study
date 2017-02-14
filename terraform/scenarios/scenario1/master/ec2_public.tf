resource "aws_instance" "public" {
  ami                         = "ami-eb49358c"
  instance_type               = "t2.nano"
  key_name                    = "${var.key_name}"
  associate_public_ip_address = 1
  subnet_id                   = "${aws_subnet.public.id}"
  vpc_security_group_ids      = [
    "${aws_security_group.app.id}",
    "${aws_security_group.developer.id}"
  ]

  root_block_device = {
    volume_type = "gp2"
    volume_size = "8"
  }

  tags {
    Name = "aws-basic-study-${var.envname}-public"
  }
}
