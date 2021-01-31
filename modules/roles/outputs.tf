output "task_role_arn" {
  value = aws_iam_role.task_role.arn
}

output "task_role_name" {
  value = aws_iam_role.task_role.name
}

output "execution_role_arn" {
  value = aws_iam_role.execution_role.arn
}

output "execution_role_name" {
  value = aws_iam_role.execution_role.name
}

