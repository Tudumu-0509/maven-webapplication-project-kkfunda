terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# Security Group – HTTP(8080) & SSH(22) open
resource "aws_security_group" "web_sg" {
  name        = "web-sg"
  description = "Allow HTTP and SSH"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 Instance
resource "aws_instance" "my_ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name   # Key pair create చేసి

  vpc_security_group_ids = [aws_security_group.web_sg.id]

  tags = {
    Name = var.instance_name
  }

  # EC2 instance లో user data ద్వారా Docker install మరియు WAR deploy
  user_data = <<-EOF
              #!/bin/bash
              sudo apt update
              sudo apt install -y docker.io docker-compose
              sudo systemctl start docker
              sudo systemctl enable docker

              # WAR deploy
              sudo docker pull tomcat:9.0.100
              sudo docker stop myapp || true
              sudo docker rm myapp || true
              sudo docker run -d -p 8080:8080 --name myapp -v /home/ubuntu/maven-web-application.war:/usr/local/tomcat/webapps/maven-web-application.war tomcat:9.0.100
              EOF
}

# Output – EC2 Public IP
output "ec2_public_ip" {
  value = aws_instance.my_ec2.public_ip
}
