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
