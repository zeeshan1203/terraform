resource "aws_instance" "sample" {
  count                   = 2
  ami                     = "ami-0760b951ddb0c20c9"         ##devops-practice ami id
  instance_type           = "t2.micro"
}
