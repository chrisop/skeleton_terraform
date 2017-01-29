resource "aws_vpc" "playground" {
  cidr_block = "10.1.0.0/16"

  tags {
    Name = "playground"
  }
}
