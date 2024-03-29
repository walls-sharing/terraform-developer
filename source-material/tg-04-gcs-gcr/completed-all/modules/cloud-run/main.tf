resource "google_cloud_run_v2_service" "hello_terraform" {
  name     = "hello-terraform"
  location = "asia-southeast1"

  template {
    containers {
      image = "us-docker.pkg.dev/cloudrun/container/hello"
      env {
        name = "BUCKET_URL"
        value = var.bucket_url
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
