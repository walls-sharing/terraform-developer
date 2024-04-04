/*********************** Main ***********************/
resource "google_cloud_run_v2_service" "hello_terraform" { // workload
  name     = "hello-terraform"
  location = "asia-southeast1"

  template {
    containers {
      image = "us-docker.pkg.dev/cloudrun/container/hello"
      env {
        name = "BUCKET_URL"
        value = "https://storage.googleapis.com/${google_storage_bucket.terraform_public_bucket.name}" // **** this depends on Cloud Storage module ****
      }
    }
  }
}
resource "google_cloud_run_v2_service_iam_member" "public_access" { // public permission
  name = google_cloud_run_v2_service.hello_terraform.name
  location = google_cloud_run_v2_service.hello_terraform.location
  role = "roles/run.invoker"
  member = "allUsers"
}

/*********************** Output ***********************/
output "cloud_run_url" {
  value = google_cloud_run_v2_service.hello_terraform.uri
}
