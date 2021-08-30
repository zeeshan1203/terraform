resource "aws_spot_instance_request" "cheap_worker" {
  ami                 = "ami-074df373d6bafa625"
  spot_price          = "0.0035"                 ##copy the ur spot request price from aws
  instance_type       = "t2.micro"

  tags = {
    Name              = "sample"
  }
}
