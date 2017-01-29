resource "aws_subnet" "playground_subnet_project1" {
  vpc_id                  = "${aws_vpc.playground.id}"
  cidr_block              = "10.1.1.0/24"
  availability_zone       = "${var.az_1}"
  map_public_ip_on_launch = true

  tags {
    Name = "playground_project1"
  }
}
