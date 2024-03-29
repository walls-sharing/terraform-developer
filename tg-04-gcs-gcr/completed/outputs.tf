output "bucket_url" {
  value = local.bucket_url
}

output "bucket_files" {
  value = module.cloud_storage.uploaded_objects

  # This will not work because refer to internal resource of module
  # value = values(module.cloud_storage.google_storage_bucket_object.terraform_logo)[*].name
}

output "cloud_run_url" {
  value = module.cloud_run.url
}