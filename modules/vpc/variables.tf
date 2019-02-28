variable "cidr_block" {
  description = "The cluster vpc cidr block"
}

variable "subnet_cidr_block" {
  description = "The cluster subnet cidr block"
}

# depends_on workaround

variable "depends_on" {
  description = "Helper variable to simulate depends_on for terraform modules"
  default     = []
}
