resource "null_resource" "ansible-apply" {
  count               = length(var.COMPONENTS)
  provisioner "remote-exec" {

    connection {
      host            = "${element(var.COMPONENTS, count.index)}.roboshop.internal"
      user            = "centos"
      password        = "DevOps321"
    }

    inline = [
      "sudo yum install ansible -y",
      "sudo yum remove ansible -y",
      "sudo pip install ansible==3.4.0",
      "ansible-pull -U https://github.com/zeeshan1203/ansible.git roboshop-pull.yml -e COMPONENT=${element(var.COMPONENTS, count.index)}"   ##ansible git url
    ]

  }
}

variable "COMPONENTS" {}
