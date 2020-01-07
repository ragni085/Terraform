provider "aws" {
  region = "us-west-2"
}

variable "ami_id" {
  default =  "ami-0c964351b41095ff7"
}

resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-0aea1c5e2dcfc9837", "sg-0e1c03ec34479caf5"]

  provisioner "remote-exec" {
    connection {
      host = self.public_ip
      user = "root"
      password = "DevOps321"
    }
    inline = [
      "yum install ansible -y",
      "echo localhost >/tmp/hosts",
      "ansible-pull -i /tmp/hosts -U http://rkb03:password@gitlab.com/devopsb43/ansible.git Playbooks/studentapp-webapp.yml"
    ]
  }
