resource "null_resource" "sample1" {
  provisioner "local-exec" {
    command = "echo ${var.input}"
  }
}

output "OUT" {
  value = var.input
}

variable "input" {}
