# AWS Region
variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

# AMI ID
variable "ami_id" {
  description = "AMI ID to use for the EC2 instance"
  type        = string
  default     = "ami-0c398cb65a93047f2"
}

# EC2 Instance Type
variable "instance_type" {
  description = "Type of EC2 instance to launch"
  type        = string
  default     = "t3.micro"
}

# EC2 Instance Name (Tag)
variable "instance_name" {
  description = "Tag name for the EC2 instance"
  type        = string
  default     = "Terraform-EC2"
}

# Key pair name
variable "key_name" {
  description = "Existing AWS Key Pair Name"
  type        = string
  default     = "North"
}
