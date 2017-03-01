resource "aws_launch_configuration" "app" {
  name = "aws-basic-study-${var.envname}-app"
  image_id = "ami-eb49358c"
  instance_type = "t2.nano"
  security_groups = [
    "${aws_security_group.app.id}",
    "${aws_security_group.developer.id}"
  ]
  key_name = "${var.key_name}"
  associate_public_ip_address = 1
  root_block_device = {
    volume_type = "gp2"
    volume_size = "8"
  }
  user_data = "${file("userdata")}"
}

resource "aws_autoscaling_group" "ag" {
  name = "aws-basic-study-${var.envname}-app"
  availability_zones        = ["${var.availability_zone}"]
  vpc_zone_identifier       = ["${aws_subnet.public.id}"]
  max_size                  = "0"
  min_size                  = "0"
  default_cooldown          = "300"
  health_check_grace_period = "300"
  health_check_type         = "ELB"
  force_delete              = "true"
  launch_configuration      = "${aws_launch_configuration.app.name}"

  lifecycle {
    ignore_changes = ["max_size", "min_size"]
  }

  tag {
    key = "Name"
    value = "aws-basic-study-${var.envname}-app"
    propagate_at_launch = true
  }
}
