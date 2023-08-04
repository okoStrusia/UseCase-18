# modules/instances/outputs.tf
output "instance_ids" {
  description = "IDs of the created instances"
  value       = [for instance in aws_instance.main : instance.id]
}
