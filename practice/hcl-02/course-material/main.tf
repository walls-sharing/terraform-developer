variable "base_filename" {
  type        = string
  description = "Sample filename"
  default     = "sample.txt"
}

variable "file_content" {
  type        = string
  description = "Sample file content"
  default     = "Hello world!"
}

resource "local_file" "sample_file_1" {
  filename = var.base_filename
  content  = var.file_content
}

output "file_content" {
  value = var.file_content
}

# variable "file_content_sensitive" {
#   sensitive = true
#   type      = string
#   default   = "Can you see me?"
# }

# resource "local_file" "sample_file_2" {
#   filename = "sensitive-${var.base_filename}"
#   content  = var.file_content_sensitive
# }

# output "file_content_sensitive" {
#   sensitive = true
#   value     = var.file_content_sensitive
# }
