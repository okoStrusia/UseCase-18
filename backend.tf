# backend.tf
terraform {
  required_version = ">= 0.13"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "plasz-usecase18-terraform-state"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "plasz-usecase18-terraform-lock"
    encrypt        = true
    profile        = "usecase"
  }
}