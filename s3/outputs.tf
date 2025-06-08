output "aws_s3_bucket_accelerate_configuration_url" {
  value = var.aws_s3_bucket_accelerate_configuration == "Enabled" ? format("%s.s3-accelerate.amazonaws.com", var.bucket_name) : ""
}
