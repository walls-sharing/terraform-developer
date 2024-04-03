variable "base_filename" {
  type        = string
  description = "Sample filename"
  default     = "sample.txt"
}

variable "file_content" {
  type        = string
  description = "Sample file content"
  default     = "Hello.."
}

resource "local_file" "sample_file_1" {
  filename = var.base_filename
  # content  = var.file_content
  content = "${var.file_content} world!"
}

output "file_content" {
  sensitive = true
  value = var.file_content
}

# variable "file_content_sensitive" {
#   sensitive = true
#   type = string
#   default = "Can you see me?"
# }

# resource "local_sensitive_file" "sample_file_2" {
#   filename = var.base_filename
#   content  = "${var.file_content_sensitive}"
# }

# output "file_content_sensitive" {
#   sensitive = true
#   value = var.file_content_sensitive
# }
