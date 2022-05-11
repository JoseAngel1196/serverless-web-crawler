
resource "aws_iam_role" "iam_for_lambda" {
  name = "Serverless-Web-Crawler-Role"
  assume_role_policy = jsonencode(
    {
      Statement = [
        {
          Action = "sts:AssumeRole"
          Effect = "Allow"
          Principal = {
            Service = "lambda.amazonaws.com"
          }
        },
      ]
      Version = "2012-10-17"
    }
  )
}

resource "aws_iam_policy" "iam_role_policy_for_lambda" {

  name        = "aws_iam_policy_for_terraform_aws_lambda_role"
  description = "AWS IAM Policy for managing aws lambda role"
  policy = jsonencode(
    {
      Statement = [
        {
          Action   = ["s3:GetObject", "s3:PutObject"],
          Effect   = "Allow",
          Resource = "${var.bucket_arn}"
        },
        # {
        #   Action   = ["dynamodb:Scan", "dynamodb:Query", "dynamodb:PutItem"],
        #   Effect   = "Allow",
        #   Resource = "${var.gasoline_prices_table_arn}"
        # },
        {
          Action   = ["logs:CreateLogGroup", "logs:CreateLogStream", "logs:PutLogEvents", "logs:DescribeLogStreams", "logs:createExportTask"],
          Effect   = "Allow",
          Resource = "*"
        },
        {
          Action   = ["sqs:*"],
          Effect   = "Allow",
          Resource = "${var.sqs_arn}"
        },
        #   {
        #     Action   = ["dynamodb:DescribeStream", "dynamodb:GetRecords", "dynamodb:GetShardIterator", "dynamodb:ListStreams"],
        #     Effect   = "Allow",
        #     Resource = "${var.gasoline_price_table_stream_arn}"
        #   },
      ]
      Version = "2012-10-17"
  })
}

resource "aws_iam_role_policy_attachment" "lambda_attach_policy" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = aws_iam_policy.iam_role_policy_for_lambda.arn
}
