provider "google" {
  project     = "focus-union-416313"
  region      = "asia-southeast1"
  zone        = "asia-southeast1-b"
  credentials = "../tf-gcloud.json"
}

resource "google_cloud_run_service" "hello_terraform" {
  name     = "hello-terraform"
  location = "asia-southeast1"

  template {
    spec {
      containers {
        image = "us-docker.pkg.dev/cloudrun/container/hello"
      }
    }
  }
}

# output "url" {
#   value = google_cloud_run_service.hello_terraform.status.*.url // splat expression
# }

## Non-Authoritative
# resource "google_cloud_run_service_iam_member" "public_access" {
#   service = google_cloud_run_service.hello_terraform.name
#   location = google_cloud_run_service.hello_terraform.location
#   role = "roles/run.invoker"
#   member = "allUsers"
# }

# # Authoritative
# data "google_iam_policy" "all_users_invoker" {
#   binding {
#     role = "roles/run.invoker"
#     members = ["allUsers"]
#   }
# }
# resource "google_cloud_run_service_iam_policy" "allow_all_users_invoker" {
#   service = google_cloud_run_service.hello_terraform.name
#   location = google_cloud_run_service.hello_terraform.location
#   policy_data = data.google_iam_policy.all_users_invoker.policy_data
# }
