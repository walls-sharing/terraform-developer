provider "google" {
  project     = "focus-union-416313"
  region      = "asia-southeast1"
  zone        = "asia-southeast1-b"
  credentials = "../../tf-gcloud.json"
}

# Ref: https://developer.hashicorp.com/terraform/language/modules/syntax
# Ref: https://developer.hashicorp.com/terraform/language/modules/sources
module "cloud_storage" {
  source          = "./modules/cloud-storage"
  bucket_location = var.gcs_bucket_location
  bucket_name     = var.gcs_bucket_name
  object_files    = var.gcs_object_files
}

locals {
  bucket_url = "https://storage.googleapis.com/${var.gcs_bucket_name}"
}

module "cloud_run" {
  depends_on = [ module.cloud_storage ]
  source     = "./modules/cloud-run"
  bucket_url = local.bucket_url
}
