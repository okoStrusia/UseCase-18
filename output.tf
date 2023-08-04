# output.tf
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.network.vpc_id
}

output "subnet_ids" {
  description = "The IDs of the subnets"
  value       = [for s in module.network.subnets : s.id]
}

output "instance_ids" {
  description = "IDs of the instances"
  value       = module.instances.instance_ids
}
