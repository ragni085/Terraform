variable "sample-var" {
  default = "abc"
}

output "SAMPLE_VAR" {
  value = var.sample-var
}
