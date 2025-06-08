resource "aws_kms_key" "kms_key" {
  description             = var.kms_key_description
  enable_key_rotation     = var.enable_key_rotation
  deletion_window_in_days = var.deletion_window_in_days
  is_enabled              = var.is_enabled
  multi_region            = var.multi_region
}

resource "aws_kms_alias" "alias" {
  count         = var.aws_kms_alias != "" ? 1 : 0
  name          = var.aws_kms_alias
  target_key_id = aws_kms_key.kms_key.key_id
}
