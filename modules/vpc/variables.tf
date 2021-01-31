variable "cidr_block" {
  description = "The cluster vpc cidr block"
  type        = string
}

variable "public_subnet_cidr_block" {
  description = "The cluster subnet cidr block for the public network"
  type        = string
}

variable "private_subnet_cidr_block" {
  description = "The cluster subnet cidr block for the private network"
  type        = string
  default     = ""
}

