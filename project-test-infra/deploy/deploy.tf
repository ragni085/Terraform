variable "URL" {}
resource "null_resource" "deploy" {
  provisioner "remote-exec" {
    connection {
      host = aws_instance.test.public_ip
      user = "root"
      password = "DevOps321"
    }

    inline = [
      "ansible-pull -i /tmp/hosts -U  https://github.com/ragni085/ansible.git ansible/Playbooks/deploy.yml -e URL=${var.URL}"
    ]
  }
}


