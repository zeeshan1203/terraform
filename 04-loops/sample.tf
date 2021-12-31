resource "aws_instance" "sample" {
  count                   = 2
  ami                     = "ami-074df373d6bafa625"         ##devops-practice ami id
  instance_type           = "t2.micro"
}
