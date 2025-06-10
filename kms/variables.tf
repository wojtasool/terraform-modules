variable "kms_key_description" {
  type        = string
  default     = "Default KMS description"
  description = "KMS Key description"
}

variable "enable_key_rotation" {
  type        = bool
  default     = true
  description = "Enable KMS key automatic rotation"
}

variable "is_enabled" {
  type        = bool
  default     = true
  description = "Enable KMS key creation"
}

variable "multi_region" {
  type        = bool
  default     = false
  description = "Create Multi Region KMS key"
}

variable "aws_kms_alias" {
  type        = string
  default     = ""
  description = "KMS key alias"
}

variable "deletion_window_in_days" {
  type        = number
  default     = 7
  description = "KMS key deletion window in days"

  validation {
    condition     = var.deletion_window_in_days >= 7 && var.deletion_window_in_days <= 30
    error_message = "The deletion_window_in_days must be 7 - 30."
  }
}
