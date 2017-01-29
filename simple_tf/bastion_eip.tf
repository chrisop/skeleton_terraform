resource "aws_eip" "project1_webserver" {
  instance = "${aws_instance.project1_webserver.id}"
  vpc      = true
}
