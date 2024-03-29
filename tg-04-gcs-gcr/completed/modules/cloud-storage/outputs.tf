output "uploaded_objects" {
  description = "List of uploaded objects file name"
  value = values(google_storage_bucket_object.terraform_logo)[*].name
}