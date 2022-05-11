module "s3" {
  source = "./s3"
  bucket = "serverless-web-crawler-bucket"
}

module "sqs" {
  source = "./sqs"
  sqs    = "serverless-web-crawler-sqs"
}

module "iam" {
  source     = "./iam"
  bucket_arn = module.s3.bucket_arn
  sqs_arn    = module.sqs.sqs_arn
}
