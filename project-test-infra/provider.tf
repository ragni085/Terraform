terraform {
  backend "s3" {
    bucket = "r-terraform"
    key    = "test-states"
    region = "us-west-2"
  }
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "test" {
  ami = "ami-0777ff5c030fe1d38"
  instance_type = "t2.micro"
  key_name = "devops"
  vpc_security_group_ids = ["sg-0255375ce75e2cc8d", "sg-064ad82e7020ebef4"]

  provisioner "remote-exec" {
    connection {
      host = self.public_ip
      user = "root"
      password = "DevOps321"
    }

   inline = [
    "yum install ansible -y",
     "echo localhost > /tmp/hosts",
     "ansible-pull -i /tmp/hosts -U  https://github.com/ragni085/ansible_new.git Playbooks/studentapp-webapp.yml -e DBUSER=student -e DBPASS=student1 -e DBHOST=localhost -e DBNAME=studentapp"


   ]
  }
}