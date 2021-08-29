resource "aws_instance" "sample" {
  ami                   = "ami-074df373d6bafa625"
  instance_type         = "t2.micro"
}

provider "aws" {
  region = "us-east-1"
}
