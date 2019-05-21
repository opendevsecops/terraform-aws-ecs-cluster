variable "cidr_block" {
  description = "The cluster vpc cidr block"
}

variable "public_subnet_cidr_block" {
  description = "The cluster subnet cidr block for the public network"
}

variable "private_subnet_cidr_block" {
  description = "The cluster subnet cidr block for the private network"
}
