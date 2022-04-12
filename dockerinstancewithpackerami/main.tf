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
    subnet_id = "subnet-020c027b373743a29"
    vpc_security_group_ids = ["sg-0978598c9a43ca156"]
    tags = {
        Name = "dockerwithpackerami"
        Owner = "charansaikatakam"
    }
}