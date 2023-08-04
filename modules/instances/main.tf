# modules/instances/main.tf
resource "aws_instance" "main" {
  for_each = { for idx, subnet in var.subnets : idx => subnet }

  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = each.value.id

  tags = {
    Owner = var.owner
  }
}
