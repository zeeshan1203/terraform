resource "aws_instance" "sample" {
  ami                     = "ami-0760b951ddb0c20c9"         ##devops-practice ami id
  instance_type           = "t2.micro"
  vpc_security_group_ids  = [var.sg_id]
}

variable "sg_id" {}
