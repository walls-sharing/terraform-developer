# resource "local_file" "sample_file" {
#   filename = var.filename
#   content  = var.file_content
# }

# # https://developer.hashicorp.com/terraform/language/expressions/strings
# resource "local_file" "sample_file_sensitive" {
#   filename = "sensitive-${var.filename}"
#   content  = var.file_content_sensitive
# }
