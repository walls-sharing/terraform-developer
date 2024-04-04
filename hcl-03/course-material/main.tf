################################## variables.tf ##################################
variable "filename" {
  type        = string
  description = "Sample filename"
  default     = "sample.txt"
}

variable "first_sentence" {
  type        = string
  description = "First sentence file content"
  default     = "Hello World!"
}

variable "second_sentence" {
  type        = string
  description = "First sentence file content"
  default     = "How are you?"
}

################################## main.tf ##################################
locals {
  file_content = "${var.first_sentence} ${var.second_sentence}"
}

resource "local_file" "example_file" {
  filename = var.filename
  content =  local.file_content
}

################################## outputs.tf ##################################
output "filename" {
  description = "Sample filename"
  value       = var.filename
}

output "file_content" {
  description = "Sample file content"
  value       = local.file_content
}
