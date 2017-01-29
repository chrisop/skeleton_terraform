resource "aws_internet_gateway" "playground" {
  vpc_id = "${aws_vpc.playground.id}"
}
