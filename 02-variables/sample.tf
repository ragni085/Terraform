variable "simple-string" {
  type    = string // No need of this if you give the value in double quotes
  default = "SIMPLE"
}

// Note: If you give the value in double quotes then terraform automatically considers that as a string.

variable "simple-number" {
  type = number // No need of this if you give the default value is a number and given with out quotes
  default = 100
}

variable "simple-boolean" {
  type = bool  // No need of this if you give the default value is a boolean (true / false) and given with out quotes
  default = true
}

variable "simple-list" {
  type = list
  default = [111, "abc"]
}

variable "simple-map" {
  type = map
  default = {
    trainer_name = "Raghu"
    training_name = "DevOps"
  }
}

variable "cli_var1" {}


resource "null_resource" "sample" {
  provisioner "local-exec" {
    command = "echo -e \" String = ${var.simple-string}\n Number = ${var.simple-number}\n Boolean = ${var.simple-boolean} \""
  }

  provisioner "local-exec" {
    command = "echo -e Value1 = ${var.simple-list[0]}, Trainer Name = ${var.simple-map["trainer_name"]}"
  }
}
