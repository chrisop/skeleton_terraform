# Grant the VPC internet access on its main route table
resource "aws_route" "playground_internet_access" {
  route_table_id         = "${aws_vpc.playground.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.playground.id}"
}
