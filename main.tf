module "vpc" {
  source = "modules/vpc"

  cidr_block        = "${var.vpc_cidr_block}"
  subnet_cidr_block = "${var.vpc_subnet_cidr_block}"

  tags = "${var.tags}"
}

module "cluster" {
  source = "modules/cluster"

  name = "${var.name}"

  tags = "${var.tags}"
}

module "roles" {
  source = "modules/roles"

  tags = "${var.tags}"
}
