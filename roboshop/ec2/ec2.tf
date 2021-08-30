resource "aws_spot_instance_request" "cheap_worker" {
  count               = length(var.COMPONENTS)
  ami                 = "ami-074df373d6bafa625"
  spot_price          = "0.0035"
  instance_type       = "t2.micro"

  tags = {
    Name              = element(var.COMPONENTS, count.index)
  }
}

variable "COMPONENTS" {}
