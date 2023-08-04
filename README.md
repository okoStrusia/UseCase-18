# UseCase-18

## Terraform backend
Update vars in ./create_backend_infra and execute script

## Terraform apply
Before executing create terraform.tfvars eg:
```
# terraform.tfvars
cidr_block    = "10.0.0.0/16"
subnets       = ["10.0.1.0/24", "10.0.2.0/24"]
ami           = "ami-053b0d53c279acc90"
instance_type = "t2.micro"
owner         = "MyUser123"
```