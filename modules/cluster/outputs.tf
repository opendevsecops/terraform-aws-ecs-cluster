output "name" {
  value = "${var.name}"
}

output "arn" {
  value = "${aws_ecs_cluster.main.arn}"
}
