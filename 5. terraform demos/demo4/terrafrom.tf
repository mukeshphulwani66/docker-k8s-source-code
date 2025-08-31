terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
     bucket = "myterraformbucket-1234"    
     key = "terraform/terrafrom.tfstate"
     region = "ap-south-1"
     use_lockfile = true
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "web" {
  ami           = "ami-0144277607031eca2"
  instance_type = "t2.micro"

  tags = {
    Name = "WebServerdemo"
  }
}