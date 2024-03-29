terraform {
  required_version = "~> 1.7.4"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.20.0"
    }
    # random = {
    #     source = "hashicorp/random"
    #     version = "~> 3.5.0"
    # }
  }
}

provider "google" {
  project     = "focus-union-416313"  // ** change to your project id **
  region      = "asia-southeast1"
  zone        = "asia-southeast1-b"
  credentials = "../tf-gcloud.json"
}

resource "google_storage_bucket" "my_bucket" {
  location = "ASIA-SOUTHEAST1"
  name     = "terraform-mybucket"  // ** need unique name across the globe **
}

# # Utilize random provider
# resource "random_pet" "pet" {
#   separator = "-"
# }

# resource "google_storage_bucket" "pet_bucket" {
#   location = "ASIA-SOUTHEAST1"
#   name = "terraform-${random_pet.pet.id}"
# }
