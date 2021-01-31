output "name" {
  value = var.name
}

output "vpc_cidr_block" {
  value = var.vpc_cidr_block
}

output "vpc_public_subnet_cidr_block" {
  value = var.vpc_public_subnet_cidr_block
}

output "vpc_private_subnet_cidr_block" {
  value = var.vpc_private_subnet_cidr_block
}

output "arn" {
  value = module.cluster.arn
}

output "task_role_arn" {
  value = module.roles.task_role_arn
}

output "task_role_name" {
  value = module.roles.task_role_name
}

output "execution_role_arn" {
  value = module.roles.execution_role_arn
}

output "execution_role_name" {
  value = module.roles.execution_role_name
}

output "vpc_id" {
  value = module.vpc.id
}

output "vpc_public_subnet_id" {
  value = module.vpc.public_subnet_id
}

output "vpc_private_subnet_id" {
  value = module.vpc.private_subnet_id
}

