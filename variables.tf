variable "name" {
  description = "The name of the cluster"
  type        = string
}

variable "vpc_cidr_block" {
  description = "The cluster vpc cidr block"
  type        = string
}

variable "vpc_public_subnet_cidr_block" {
  description = "The cluster subnet cidr block for the public network"
  type        = string
}

variable "vpc_private_subnet_cidr_block" {
  description = "The cluster subnet cidr block for the private network"
  type        = string
  default     = ""
}

