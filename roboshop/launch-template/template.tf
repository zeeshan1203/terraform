resource "aws_launch_template" "template" {
  name                            = "template-for-roboshop"
  image_id                        = "ami-0760b951ddb0c20c9"   ##devops-practice image id
  instance_market_options {
    market_type                   = "spot"
  }
  instance_type                   = "t2.micro"
  vpc_security_group_ids          = ["sg-090a0e4d516f82a1f"]   ##your aws security group id
}

output "template_id" {
  value = aws_launch_template.template.id
}
