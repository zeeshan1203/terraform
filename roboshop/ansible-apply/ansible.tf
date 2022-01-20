resource "null_resource" "ansible-apply" {
  //  triggers = {
  //    abc = timestamp()
  //  }
  count               = length(var.COMPONENTS)
  provisioner "remote-exec" {

    connection {
      host            = "${element(var.COMPONENTS, count.index)}.roboshop.internal"
      user            = "centos"
      password        = "DevOps321"
    }

    inline = [
      "sudo yum install python3-pip -y",
      "sudo pip3 install pip --upgrade",
      "sudo pip3 install ansible==4.1.0",
      "ansible-pull -i localhost, -U https://github.com/zeeshan1203/ansible.git roboshop-pull.yml -e COMPONENT=${element(var.COMPONENTS, count.index)}"
   ]

  }
}

variable "COMPONENTS" {}
