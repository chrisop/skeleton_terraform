resource "aws_elb" "proxy" {
  name = "proxy"

  subnets         = ["${aws_subnet.playground_subnet_project1.id}"]
  security_groups = ["${aws_security_group.project1.id}"]
  instances       = ["${aws_instance.project1_webserver.id}"]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  listener {
    instance_port      = 443
    instance_protocol  = "https"
    lb_port            = 443
    lb_protocol        = "https"
    ssl_certificate_id = "${var.ssl_cert}"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 10
    target              = "HTTP:80/check.html"
    interval            = 30
  }

  access_logs {
    bucket        = "${var.prefix}-logs-lb"
    bucket_prefix = "proxy"
    interval      = 60
    enabled       = true
  }

  tags {
    Name = "playground_proxy_elb"
  }
}

# proxy header routing to backend
resource "aws_proxy_protocol_policy" "proxy" {
  load_balancer  = "${aws_elb.proxy.name}"
  instance_ports = ["80", "443"]
}
