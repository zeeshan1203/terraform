resource "aws_spot_instance_request" "cheap_worker" {
  count                  = length(var.COMPONENTS)
  ami                    = "ami-074df373d6bafa625"
  spot_price             = "0.0035"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-0d01f7870914fc3d8"]

  tags                   = {
    Name                 = element(var.COMPONENTS, count.index)
  }
}

variable "COMPONENTS" {}

resource "time_sleep" "wait" {
  depends_on             = [aws_spot_instance_request.cheap_worker]
  create_duration        = "120s"
}

resource "aws_ec2_tag" "spot" {
  depends_on             = [time_sleep.wait]
  count                  = length(var.COMPONENTS)
  resource_id            = element(aws_spot_instance_request.cheap_worker.*.spot_instance_id, count.index)
  key                    = "Name"
  value                  = element(var.COMPONENTS, count.index)
}

resource "aws_ec2_tag" "monitor" {
  depends_on             = [time_sleep.wait]
  count                  = length(var.COMPONENTS)
  resource_id            = element(aws_spot_instance_request.cheap_worker.*.spot_instance_id, count.index)
  key                    = "Monitor"
  value                  = "yes"
}

resource "aws_route53_record" "dns" {
  depends_on             = [time_sleep.wait]
  count                  = length(var.COMPONENTS)
  zone_id                = "Z0455275BOCGUWER4BVO"  ##ur route 53 dns zone id
  name                   = "${element(var.COMPONENTS, count.index)}.roboshop.internal"
  type                   = "A"
  ttl                    = "300"
  records                = [element(aws_spot_instance_request.cheap_worker.*.private_ip, count.index)]
}
