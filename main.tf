terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region     = "us-east-1"          
  access_key = "YOUR_AWS_ACCESS_KEY"
  secret_key = "YOUR_AWS_SECRET_KEY"
}

resource "aws_instance" "my_ec2" {
  ami           = "ami-069e612f612be3a2b"  
  instance_type = "t3.micro"               

  tags = {
    Name = "Terraform-EC2"
  }
}
