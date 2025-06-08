resource "aws_sqs_queue" "this" {
  name                      = var.queue_name
  delay_seconds             = var.delay_seconds
  max_message_size          = var.max_message_size
  message_retention_seconds = var.message_retention_seconds
  receive_wait_time_seconds = var.receive_wait_time_seconds
}

resource "aws_sqs_queue" "dlq" {
  count                     = var.enable_dlq ? 1 : 0
  name                      = format("%s-dlq", var.queue_name)
  delay_seconds             = var.delay_seconds
  max_message_size          = var.max_message_size
  message_retention_seconds = var.message_retention_seconds
  receive_wait_time_seconds = var.receive_wait_time_seconds
}

resource "aws_sqs_queue_redrive_policy" "redrive_policy" {
  count     = var.enable_dlq ? 1 : 0
  queue_url = aws_sqs_queue.this.id
  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.dlq[0].arn
    maxReceiveCount     = var.max_receive_count
  })
}
