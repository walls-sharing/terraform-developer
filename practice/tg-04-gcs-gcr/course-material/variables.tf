variable "gcs_bucket_location" {
  type = string
  description = "GCS bucket location"
  default = "ASIA-SOUTHEAST1"
}

variable "gcs_bucket_name" {
    type = string
    description = "GCS bucket name (globally unique)"
}

variable "gcs_object_files" {
    type = list(string)
    description = "Files to upload"
}

