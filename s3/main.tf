resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_ownership_controls" "ownership" {
  bucket = aws_s3_bucket.s3_bucket.id

  rule {
    object_ownership = var.aws_s3_bucket_ownership_controls
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.s3_bucket.id

  versioning_configuration {
    status = var.versioning_configuration
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "side_encryption_configuration" {
  bucket = aws_s3_bucket.s3_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = var.aws_kms_key == "" ? null : var.aws_kms_key
      sse_algorithm     = var.aws_kms_key == "" ? "AES256" : "aws:kms"
    }
  }
}
