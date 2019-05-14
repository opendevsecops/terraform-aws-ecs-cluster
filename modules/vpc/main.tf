data "aws_availability_zones" "current" {}

resource "aws_vpc" "main" {
  cidr_block           = "${var.cidr_block}"
  enable_dns_hostnames = true

  tags = "${var.tags}"
}

resource "aws_subnet" "public" {
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "${var.public_subnet_cidr_block}"
  availability_zone = "${data.aws_availability_zones.current.names[0]}"

  tags = "${var.tags}"
}

resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.main.id}"

  tags = "${var.tags}"
}

resource "aws_route_table_association" "public" {
  subnet_id      = "${aws_subnet.public.id}"
  route_table_id = "${aws_route_table.public.id}"
}

resource "aws_internet_gateway" "main" {
  vpc_id = "${aws_vpc.main.id}"

  tags = "${var.tags}"
}

resource "aws_route" "public_to_internet" {
  route_table_id         = "${aws_route_table.public.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.main.id}"
}

resource "aws_subnet" "private" {
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "${var.private_subnet_cidr_block}"
  availability_zone = "${data.aws_availability_zones.current.names[0]}"

  tags = "${var.tags}"
}

resource "aws_route_table" "private" {
  vpc_id = "${aws_vpc.main.id}"

  tags = "${var.tags}"
}

resource "aws_route_table_association" "private" {
  subnet_id      = "${aws_subnet.private.id}"
  route_table_id = "${aws_route_table.private.id}"
}

resource "aws_eip" "nat" {
  vpc = true

  tags = "${var.tags}"

  depends_on = ["aws_internet_gateway.main"]
}

resource "aws_nat_gateway" "main" {
  allocation_id = "${aws_eip.nat.id}"
  subnet_id     = "${aws_subnet.public.id}"

  tags = "${var.tags}"

  depends_on = ["aws_internet_gateway.main"]
}

resource "aws_route" "private_to_nat" {
  route_table_id         = "${aws_route_table.private.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${aws_nat_gateway.main.id}"
}
