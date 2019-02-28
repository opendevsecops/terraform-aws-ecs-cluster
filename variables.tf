variable "name" {
  description = "The name of the cluster"
}

variable "vpc_cidr_block" {
  description = "The cluster vpc cidr block"
}

variable "vpc_subnet_cidr_block" {
  description = "The cluster subnet cidr block"
}

variable "tags" {
  default = {}
}

# depends_on workaround

variable "depends_on" {
  description = "Helper variable to simulate depends_on for terraform modules"
  default     = []
}
