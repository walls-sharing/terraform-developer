output "filename" {
  description = "Sample filename"
  value       = var.filename
}

output "file_content" {
  description = "Sample file content"
  value       = var.file_content
}

output "file_content_sensitive" {
  sensitive   = true
  description = "Sample sensitive file content"
  value       = var.file_content_sensitive
}
