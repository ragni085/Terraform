provider "aws" {
  region = "us-west-2"
}

variable "ami_id" {
  default =  "ami-02c419e998e13412a"
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
      "cd /tmp",
      "git clone https://rkb03:password@gitlab.com/devopsb43/shell-scripts.git",
      "cd shell-scripts/Project/studentapp",
      "sh webapp.sh"
    ]
  }
}
