terraform {
  required_version = "> 1.5.7" // You're likely use "~> 1.5.1" means 1.5.x but not 1.6.x
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.20.0"
    }
    random = {
        source = "hashicorp/random"
        version = "~> 3.5.0"
    }
  }
}

# Config cloud project to use
provider "google" {
  project     = "focus-union-416313"  // ** change to your project id **
  region      = "asia-southeast1"
  zone        = "asia-southeast1-b"
  credentials = "../tf-gcloud.json"
}

/*
* Let's check provider config
*/
resource "random_pet" "pet" {
  separator = "-"
}
resource "google_storage_bucket" "my_bucket" {
  location = "ASIA-SOUTHEAST1"
  name     = "terraform-${random_pet.pet.id}"  // ** need unique name across the globe **
}
