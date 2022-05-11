output "bucket_arn" {
  value = module.s3.bucket_arn
}

output "bucket_name" {
  value = module.s3.bucket_name
}

output "iam_arn" {
  value = module.iam.iam_arn
}

output "sqs_name" {
  value = module.sqs.sqs_name
}

output "sqs_arn" {
  value = module.sqs.sqs_arn
}
