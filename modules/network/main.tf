# modules/network/main.tf
resource "aws_vpc" "main" {
  cidr_block = var.cidr_block

  tags = {
    Owner = var.owner
  }
}

resource "aws_subnet" "main" {
  for_each = { for idx, cidr in var.subnets : idx => cidr }

  vpc_id     = aws_vpc.main.id
  cidr_block = each.value

  tags = {
    Owner = var.owner
  }
}

output "subnets" {
  value = aws_subnet.main
}
