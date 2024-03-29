variable "base_filename" {
  type        = string
  description = "Sample filename"
  default     = "sample.txt"
}

variable "file_content" {
  type        = string
  description = "Sample file content"
  default     = "Hello World!"
}

resource "local_file" "sample_file" {
  filename = var.base_filename
  content  = var.file_content
}