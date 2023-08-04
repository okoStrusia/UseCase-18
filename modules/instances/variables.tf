# modules/instances/variables.tf
variable "ami" {
  description = "The Amazon Machine Image ID to use for the instances"
  type        = string
}

variable "instance_type" {
  description = "The instance type to use for the instances"
  type        = string
}

variable "subnets" {
  description = "The IDs of the subnets where the instances will be created"
  type        = map(any)
}

variable "owner" {
  description = "The owner of the resources"
  type        = string
}