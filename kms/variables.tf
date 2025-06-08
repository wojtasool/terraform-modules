variable "kms_key_description" {
  type    = string
  default = "Default KMS description"
}

variable "enable_key_rotation" {
  type    = bool
  default = true
}

variable "is_enabled" {
  type    = bool
  default = true
}

variable "multi_region" {
  type    = bool
  default = false
}

variable "aws_kms_alias" {
  type    = string
  default = ""
}

variable "deletion_window_in_days" {
  type    = number
  default = 7

  validation {
    condition     = var.deletion_window_in_days >= 7 && var.deletion_window_in_days <= 30
    error_message = "The deletion_window_in_days must be 7 - 30."
  }
}
