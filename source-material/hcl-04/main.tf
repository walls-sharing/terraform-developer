################################## Variables ##################################
variable "filename" {
  type        = string
  description = "Sample filename"
  default     = "sample.txt"
}

variable "file_content" {
  type        = string
  description = "Sample file content"
  default     = "Hello World!"
}

variable "file_content_sensitive" {
  sensitive   = true
  type        = string
  description = "Sample sensitive file content"
  default     = "Hello Secret!"
}


################################## Resources ##################################
resource "local_file" "sample_file" {
  filename = var.filename
  content  = var.file_content
}

resource "local_file" "sample_file_sensitive" {
  filename = "sensitive-${var.filename}"  # https://developer.hashicorp.com/terraform/language/expressions/strings
  content  = var.file_content_sensitive
}


################################## Outputs ##################################
# output "filename" {
#   description = "Sample filename"
#   value       = var.filename
# }

# output "file_content" {
#   description = "Sample file content"
#   value       = var.file_content
# }

# output "file_content_sensitive" {
#   sensitive   = true
#   description = "Sample sensitive file content"
#   value       = var.file_content_sensitive
# }
