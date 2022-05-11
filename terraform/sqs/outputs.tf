output "sqs_arn" {
  value = aws_sqs_queue.this.arn
}

output "sqs_name" {
  value = aws_sqs_queue.this.name
}
