resource "aws_instance" "project1_webserver" {
  ami           = "ami-9bf712f4"
  instance_type = "t2.nano"

  key_name               = "${aws_key_pair.auth_playground.key_name}"
  vpc_security_group_ids = ["${aws_security_group.project1.id}"]
  subnet_id              = "${aws_subnet.playground_subnet_project1.id}"

  # Prevent termination over API
  disable_api_termination              = true
  instance_initiated_shutdown_behavior = "stop"

  root_block_device {
    volume_type           = "gp2"
    volume_size           = 8
    delete_on_termination = false
  }

  connection {
    user        = "centos"
    private_key = "${file("~/../.ssh/id_rsa")}"
  }

  tags {
    Name = "playground_project1_webserver"
  }
}
