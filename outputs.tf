output "name" {
  value = "${var.name}"
}

output "vpc_cidr_block" {
  value = "${var.vpc_cidr_block}"
}

output "vpc_subnet_cidr_block" {
  value = "${var.vpc_subnet_cidr_block}"
}

output "arn" {
  value = "${module.cluster.arn}"
}

output "task_role_arn" {
  value = "${module.cluster.task_role_arn}"
}

output "task_role_name" {
  value = "${module.cluster.task_role_name}"
}

output "execution_role_arn" {
  value = "${module.cluster.execution_role_arn}"
}

output "execution_role_name" {
  value = "${module.cluster.execution_role_name}"
}

output "vpc_id" {
  value = "${module.vpc.id}"
}

output "vpc_subnet_id" {
  value = "${module.vpc.subnet_id}"
}
