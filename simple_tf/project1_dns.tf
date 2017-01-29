resource "aws_route53_record" "project1_webserver" {
  zone_id = "${var.zone_id}"
  name    = "webserver.domain.de"
  type    = "A"
  ttl     = 300

  records = [
    "${aws_eip.project1_webserver.public_ip}",
  ]
}
