# modules/network/variables.tf
variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "subnets" {
  description = "The CIDR blocks for the subnets"
  type        = list(string)
}

variable "owner" {
  description = "The owner of the resources"
  type        = string
}