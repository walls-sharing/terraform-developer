variable "bucket_location" {
  type        = string
  description = "Bucket location."
  default     = "ASIA-SOUTHEAST1"
}

variable "object_lifetime_days" {
  type        = number
  description = "Time before automatic delete the object."
  default     = 3
}

# Required
variable "bucket_name" {
  type        = string
  description = "Bucket name."
}

# Required
variable "object_files" {
  type        = list(string)
  description = "Files to upload to bucket."
}
