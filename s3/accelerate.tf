resource "aws_s3_bucket_accelerate_configuration" "accelerate" {
  count  = var.aws_s3_bucket_accelerate_configuration == "Enabled" || var.aws_s3_bucket_accelerate_configuration == "Suspended" ? 1 : 0
  bucket = aws_s3_bucket.s3_bucket.id
  status = var.aws_s3_bucket_accelerate_configuration
}
