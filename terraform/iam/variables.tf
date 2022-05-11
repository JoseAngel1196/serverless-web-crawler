variable "lambdas_arn" {
  type    = list(string)
  default = ["1", "2"]
}

variable "bucket_arn" {
  type = string
}

variable "sqs_arn" {
  type = string
}
