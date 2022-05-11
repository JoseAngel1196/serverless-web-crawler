# S3 bucket to store the lambda

resource "aws_s3_bucket" "this" {
  bucket = var.bucket

  tags = {
    Name = var.bucket
  }
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket                  = aws_s3_bucket.this.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}