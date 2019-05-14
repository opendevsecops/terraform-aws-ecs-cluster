variable "cidr_block" {
  description = "The cluster vpc cidr block"
}

variable "public_subnet_cidr_block" {
  description = "The cluster subnet cidr block for the public network"
}

variable "private_subnet_cidr_block" {
  description = "The cluster subnet cidr block for the private network"
}

variable "tags" {
  default = {}
}

# depends_on workaround

variable "depends_on" {
  description = "Helper variable to simulate depends_on for terraform modules"
  default     = []
}
