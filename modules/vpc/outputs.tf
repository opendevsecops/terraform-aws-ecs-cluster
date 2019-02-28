output "cidr_block" {
  value = "${var.cidr_block}"
}

output "subnet_cidr_block" {
  value = "${var.subnet_cidr_block}"
}

output "id" {
  value = "${aws_vpc.main.id}"
}

output "subnet_id" {
  value = "${aws_subnet.main.id}"
}
