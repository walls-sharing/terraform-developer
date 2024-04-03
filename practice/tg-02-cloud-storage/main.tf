terraform {
  required_version = "~> 1.7.4"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.20.0"
    }
  }
}

provider "google" {
  project     = "focus-union-416313"  // ** change to your project id **
  region      = "asia-southeast1"
  zone        = "asia-southeast1-b"
  credentials = "../tf-gcloud.json"
}

resource "google_storage_bucket" "terraform_public_bucket" {
  location      = "ASIA-SOUTHEAST1"
  name          = "tee-terraform-bucket"  // ** must be unique across gcp **
  labels        = { "env" = "tf_env" }

  // meta argument
  lifecycle_rule {
    condition { age = 3 }
    action { type = "Delete" }
  }
}

# Allow public access to bucket
# To view file: https://storage.googleapis.com/[bucket]
resource "google_storage_bucket_access_control" "public_bucket" {
  bucket = google_storage_bucket.terraform_public_bucket.name
  role   = "READER"
  entity = "allUsers"
}

# Upload logo 1, 2, 3 
resource "google_storage_bucket_object" "terraform_logo_1" {
  bucket = google_storage_bucket.terraform_public_bucket.name
  name   = "terraform-logo1.png"
  source = "./terraform-logo1.png"
}
resource "google_storage_bucket_object" "terraform_logo_2" {
  bucket = google_storage_bucket.terraform_public_bucket.name
  name   = "terraform-logo2.png"
  source = "./terraform-logo2.png"
}
resource "google_storage_bucket_object" "terraform_logo_3" {
  bucket = google_storage_bucket.terraform_public_bucket.name
  name   = "terraform-logo3.png"
  source = "./terraform-logo3.png"
}

# Allow public access to object
# To view file: https://storage.googleapis.com/[bucket]/terraform-logo1.png
resource "google_storage_object_access_control" "public_terraform_logo_1" {
  object = google_storage_bucket_object.terraform_logo_1.name  // implicit dependency
  bucket = google_storage_bucket.terraform_public_bucket.name
  role   = "READER"
  entity = "allUsers"
}
resource "google_storage_object_access_control" "public_terraform_logo_2" {
  object = google_storage_bucket_object.terraform_logo_2.name
  bucket = google_storage_bucket.terraform_public_bucket.name
  role   = "READER"
  entity = "allUsers"
}
resource "google_storage_object_access_control" "public_terraform_logo_3" {
  object = google_storage_bucket_object.terraform_logo_3.name
  bucket = google_storage_bucket.terraform_public_bucket.name
  role   = "READER"
  entity = "allUsers"
}


## LOOP: Method 1 ##
# locals {
#   numbers = ["1", "2", "3"]
# }
# resource "google_storage_bucket_object" "terraform_logo" {
#   count = length(toset(local.numbers))
#   bucket   = google_storage_bucket.terraform_public_bucket.name
#   name     = "terraform-logo${local.numbers[count.index]}.png"
#   source   = "./terraform-logo${local.numbers[count.index]}.png"
# }


# LOOP: Method 2 ##
# locals {
#   files = [
#     "terraform-logo1.png",
#     "terraform-logo2.png",
#     "terraform-logo3.png"
#   ]
# }
# resource "google_storage_bucket_object" "terraform_logo" {
#   for_each = toset(local.files)
#   bucket   = google_storage_bucket.terraform_public_bucket.name
#   name     = each.value
#   source   = each.value
# }


## LOOP: Method 3 ##
# locals {
#   files = [
#     {
#       object_name : "terraform-logo-1.png",
#       source_file : "./terraform-logo1.png"
#     },
#     {
#       object_name : "terraform-logo-2.png",
#       source_file : "./terraform-logo2.png"
#     },
#     {
#       object_name : "terraform-logo-3.png",
#       source_file : "./terraform-logo3.png"
#     }
#   ]
# }
# resource "google_storage_bucket_object" "terraform_logo" {
#   for_each = { for file in local.files : file.object_name => file } // { "terraform-logo-1.png" = {object_name: "terraform-logo-1.png",source_file: "./terraform-logo1.png"}, "terraform-logo-2.png" = {...} ..}
#   bucket   = google_storage_bucket.terraform_public_bucket.name
#   name     = each.value.object_name
#   source   = each.value.source_file
# }
