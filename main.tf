module "vpc" {
  source = "modules/vpc"

  cidr_block        = "${var.vpc_cidr_block}"
  subnet_cidr_block = "${var.vpc_subnet_cidr_block}"
}

module "cluster" {
  source = "modules/cluster"

  name = "${var.name}"

  depends_on = ["module.vpc.vpc_id"]
}
