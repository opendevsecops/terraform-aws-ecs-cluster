data "aws_availability_zones" "current" {
}

resource "aws_vpc" "main" {
  cidr_block           = var.cidr_block
  enable_dns_hostnames = true

  tags = var.tags
}

resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_subnet_cidr_block
  availability_zone = data.aws_availability_zones.current.names[0]

  tags = var.tags
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  tags = var.tags
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = var.tags
}

resource "aws_route" "public_to_internet" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main.id
}

locals {
  enable_private = var.private_subnet_cidr_block == "" ? 0 : 1
}

resource "aws_subnet" "private" {
  count = local.enable_private

  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidr_block
  availability_zone = data.aws_availability_zones.current.names[0]

  tags = var.tags
}

resource "aws_route_table" "private" {
  count = local.enable_private

  vpc_id = aws_vpc.main.id

  tags = var.tags
}

resource "aws_route_table_association" "private" {
  count = local.enable_private

  subnet_id      = aws_subnet.private[0].id
  route_table_id = aws_route_table.private[0].id
}

resource "aws_eip" "nat" {
  count = local.enable_private

  vpc = true

  tags = var.tags

  depends_on = [aws_internet_gateway.main]
}

resource "aws_nat_gateway" "main" {
  count = local.enable_private

  allocation_id = aws_eip.nat[0].id
  subnet_id     = aws_subnet.public.id

  tags = var.tags

  depends_on = [aws_internet_gateway.main]
}

resource "aws_route" "private_to_nat" {
  count = local.enable_private

  route_table_id         = aws_route_table.private[0].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.main[0].id
}

