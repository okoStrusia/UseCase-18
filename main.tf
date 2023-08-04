# main.tf
provider "aws" {
  profile = var.profile
  region  = "us-east-1"
}

module "network" {
  source     = "./modules/network"
  owner      = var.owner
  cidr_block = var.cidr_block
  subnets    = var.subnets
}

module "instances" {
  source        = "./modules/instances"
  owner         = var.owner
  ami           = var.ami
  instance_type = var.instance_type
  subnets       = module.network.subnets
}
