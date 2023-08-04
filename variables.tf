# variables.tf
variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "subnets" {
  description = "The CIDR blocks for the subnets"
  type        = list(string)
}

variable "ami" {
  description = "The AMI to use for the instances"
  type        = string
}

variable "instance_type" {
  description = "The instance type to use for the instances"
  type        = string
}

variable "owner" {
  description = "The owner of the resources"
  type        = string
}

variable "profile" {
  description = "AWS profile used for executing script"
  type        = string
}
