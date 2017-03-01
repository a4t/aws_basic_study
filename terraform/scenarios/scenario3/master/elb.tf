resource "aws_elb" "api_elb" {
  name = "aws-basic-study-${var.envname}-elb"
  subnets = ["${aws_subnet.public.id}"]

  security_groups = ["${aws_security_group.app.id}"]

  listener {
    instance_port = 80
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }

  health_check {
    healthy_threshold = "2"
    unhealthy_threshold = "10"
    timeout = "5"
    target = "HTTP:80/"
    interval = "30"
  }

  cross_zone_load_balancing = true
  idle_timeout = 60
  connection_draining = true
  connection_draining_timeout = 60

  tags {
    Name = "aws-basic-study-${var.envname}-elb"
  }
}
