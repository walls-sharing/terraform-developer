provider "google" {
  project     = "focus-union-416313"
  region      = "asia-southeast1"
  zone        = "asia-southeast1-b"
  credentials = "../tf-gcloud.json"
}
#################################### Outputs ####################################
output "bucket_url" {
  value = google_cloud_run_v2_service.hello_terraform.uri
}

output "bucket_files" {
  value = values(google_storage_bucket_object.terraform_logo)[*].name
}

output "cloud_run_url" {
  value = "https://storage.googleapis.com/${var.bucket_name}"
}

#################################### Variables ####################################
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


#################################### Cloud Storage ####################################
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
  source   = "${path.module}/${each.value}"
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


#################################### Cloud Run ####################################
resource "google_cloud_run_v2_service" "hello_terraform" {
  name     = "hello-terraform"
  location = "asia-southeast1"

  template {
    containers {
      image = "us-docker.pkg.dev/cloudrun/container/hello"
      env {
        name = "BUCKET_URL"
        value = "https://storage.googleapis.com/${var.bucket_name}"
      }
    }
  }
}

# Non-Authoritative
resource "google_cloud_run_v2_service_iam_member" "public_access" {
  name = google_cloud_run_v2_service.hello_terraform.name
  location = google_cloud_run_v2_service.hello_terraform.location
  role = "roles/run.invoker"
  member = "allUsers"
}
