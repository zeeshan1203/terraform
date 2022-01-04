resource "aws_spot_instance_request" "cheap_worker" {
  count                  = length(var.COMPONENTS)
  ami                    = "ami-0760b951ddb0c20c9"         ##devops-practice ami id
  spot_price             = "0.0035"                        ##verify your spot price
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-090a0e4d516f82a1f"]        ##ur security group id
  wait_for_fulfillment = true

  tags                   = {
    Name                 = element(var.COMPONENTS, count.index)
  }
}

variable "COMPONENTS" {}

resource "null_resource" "wait" {
  depends_on = [aws_spot_instance_request.cheap_worker]
  triggers = {
    abc = timestamp()
  }

  provisioner "local-exec" {
    command = "sleep 60"
  }
}

resource "aws_ec2_tag" "spot" {
  depends_on             = [null_resource.wait]
  count                  = length(var.COMPONENTS)
  resource_id            = element(aws_spot_instance_request.cheap_worker.*.spot_instance_id, count.index)
  key                    = "Name"
  value                  = element(var.COMPONENTS, count.index)
}

resource "aws_ec2_tag" "monitor" {
  depends_on             = [null_resource.wait]
  count                  = length(var.COMPONENTS)
  resource_id            = element(aws_spot_instance_request.cheap_worker.*.spot_instance_id, count.index)
  key                    = "Monitor"
  value                  = "yes"
}

resource "aws_route53_record" "dns" {
  depends_on             = [null_resource.wait]
  count                  = length(var.COMPONENTS)
  zone_id                = "Z066850733D6NJMSTTFJ4"          ##ur route 53 dns zone id
  name                   = "${element(var.COMPONENTS, count.index)}.roboshop.internal"
  type                   = "A"
  ttl                    = "300"
  records                = [element(aws_spot_instance_request.cheap_worker.*.private_ip, count.index)]
}

