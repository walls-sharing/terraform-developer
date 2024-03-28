# variable "base_filename" {
#   type        = string
#   description = "Sample filename"
#   default     = "sample.txt"
# }

# variable "file_content" {
#   type        = string
#   description = "Sample file content"
#   default     = "Hello World!"
# }

# variable "file_content_sensitive" {
#   sensitive   = true
#   type        = string
#   description = "Sample sensitive file content"
#   default     = "Hello Secret!"
# }

# resource "local_file" "sample_file" {
#   filename = var.base_filename
#   content  = var.file_content
# }

# resource "local_file" "sample_file_sensitive_content" {
#   filename = "${var.base_filename}-sensitive" # https://developer.hashicorp.com/terraform/language/expressions/strings
#   content  = var.file_content_sensitive
# }
