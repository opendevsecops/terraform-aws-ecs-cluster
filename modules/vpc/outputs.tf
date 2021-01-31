output "cidr_block" {
  value = var.cidr_block
}

output "public_subnet_cidr_block" {
  value = var.public_subnet_cidr_block
}

output "private_subnet_cidr_block" {
  value = var.private_subnet_cidr_block
}

output "id" {
  value = aws_vpc.main.id
}

output "public_subnet_id" {
  value = aws_subnet.public.id
}

output "private_subnet_id" {
  value = length(aws_subnet.private) == 0 ? "" : aws_subnet.private[0].id
}

