## Create Bucket
resource "google_storage_bucket" "terraform_public_bucket" {
  location      = var.bucket_location
  name          = var.bucket_name
  labels        = { "env" = "tf_env" }

  lifecycle_rule {
    condition { age = var.object_lifetime_days }
    action { type = "Delete" }
  }
}

## Upload file
resource "google_storage_bucket_object" "terraform_logo" {
  for_each = toset(var.object_files)
  bucket   = google_storage_bucket.terraform_public_bucket.name
  name     = each.value
  source   = "${path.module}/../../${each.value}"
}

## Allow public access to object
resource "google_storage_object_access_control" "public_terraform_logo" {
  depends_on = [ google_storage_bucket_object.terraform_logo ]
  for_each = toset(var.object_files)
  bucket = google_storage_bucket.terraform_public_bucket.name
  object = each.value
  role   = "READER"
  entity = "allUsers"
}
