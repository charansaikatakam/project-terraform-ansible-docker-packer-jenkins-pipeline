terraform {
  required_version = "<=1.1.8"
  required_providers {
    aws = {
        source = "hashicorp/aws",
        version = "~> 4.6"
    }
  }
}

provider "aws" {
    access_key = var.projectaccesskey
    secret_key = var.projectsecretkey
    region = var.projectregion
}

resource "aws_instance" "projectjenkinsinstance" {

    ami = var.projectami
    associate_public_ip_address = true
    availability_zone = "us-east-1a"
    instance_type = "t2.micro"
    private_ip = "10.0.1.7"
    key_name = "AWS PRIVATE KEY"
    subnet_id = "subnet-045e5dc016bb07df5"
    vpc_security_group_ids = ["sg-082b484002e83a8b4"]
    tags = {
        Name = "dockerwithpackerami"
        Owner = "charansaikatakam"
    }
}