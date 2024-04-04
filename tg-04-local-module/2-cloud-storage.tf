/*********************** Variables ***********************/
variable "bucket_location" {
  type = string
  description = "GCS bucket location"
  default = "ASIA-SOUTHEAST1"
}
variable "object_lifetime_days" {
  type        = number
  description = "Time before automatic delete the object."
  default     = 3
}
variable "bucket_name" {
    type = string
    description = "GCS bucket name (globally unique)"
}
variable "object_files" {
    type = list(string)
    description = "Files to upload"
}

/*********************** Main ***********************/
resource "google_storage_bucket" "terraform_public_bucket" { // bucket
  location      = var.bucket_location
  name          = var.bucket_name
  labels        = { "env" = "tf_env" }

  lifecycle_rule {
    condition { age = var.object_lifetime_days }
    action { type = "Delete" }
  }
}
resource "google_storage_bucket_object" "terraform_logo" { // files
  for_each = toset(var.object_files)
  bucket   = google_storage_bucket.terraform_public_bucket.name
  name     = each.value
  source   = "${path.module}/${each.value}"
}
resource "google_storage_object_access_control" "public_terraform_logo" { // public permission
  depends_on = [ google_storage_bucket_object.terraform_logo ]
  for_each = toset(var.object_files)
  bucket = google_storage_bucket.terraform_public_bucket.name
  object = each.value
  role   = "READER"
  entity = "allUsers"
}

/*********************** Outputs ***********************/
output "bucket_url" {
  value = "https://storage.googleapis.com/${google_storage_bucket.terraform_public_bucket.name}"
}
output "bucket_files" {
  value = values(google_storage_bucket_object.terraform_logo)[*].name
}
