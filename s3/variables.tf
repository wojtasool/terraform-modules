variable "bucket_name" {
  type = string
}

variable "versioning_configuration" {
  type    = string
  default = "Enabled"

  validation {
    condition     = var.versioning_configuration == "Enabled" || var.versioning_configuration == "Disabled" || var.versioning_configuration == "Suspended"
    error_message = "The versioning_configuration must be either Enabled , Suspended or Disabled."
  }
}

variable "aws_s3_bucket_ownership_controls" {
  type    = string
  default = "BucketOwnerPreferred"

  validation {
    condition     = var.aws_s3_bucket_ownership_controls == "BucketOwnerPreferred" || var.aws_s3_bucket_ownership_controls == "ObjectWriter" || var.aws_s3_bucket_ownership_controls == "BucketOwnerEnforced"
    error_message = "The aws_s3_bucket_ownership_controls must be either Enabled , Suspended or Disabled."
  }
}

variable "aws_s3_bucket_accelerate_configuration" {
  type    = string
  default = "Disabled"

  validation {
    condition     = var.aws_s3_bucket_accelerate_configuration == "Enabled" || var.aws_s3_bucket_accelerate_configuration == "Suspended" || var.aws_s3_bucket_accelerate_configuration == "Disabled"
    error_message = "The aws_s3_bucket_accelerate_configuration must be either Enabled or Suspended."
  }
}

variable "aws_kms_key" {
  type    = string
  default = ""
}
