resource "aws_launch_template" "template" {
  name                            = "template-for-roboshop"
  image_id                        = "ami-074df373d6bafa625"   ##devops-practice image id
  instance_market_options {
    market_type                   = "spot"
  }
  instance_type                   = "t2.micro"
  vpc_security_group_ids          = ["sg-0d01f7870914fc3d8"]   ##your aws security group id
}
