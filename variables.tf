variable "image_uri" {
  description = "Optional ECR image (for image based lambda)"
  default     = ""
}

variable "s3_bucket" {
  description = "The name of the bucket containing your uploaded Lambda deployment package."
  default     = ""
}

variable "s3_key" {
  description = "The s3 key for your Lambda deployment package."
  default     = ""
}

variable "function_name" {
  description = "The name of the Lambda function."
}

variable "handler" {
  description = "The function within your code that Lambda calls to begin execution."
}

variable "runtime" {
  description = "The runtime environment for the Lambda function you are uploading."
}

variable "subnet_ids" {
  type        = list(string)
  description = "The VPC subnets in which the Lambda runs."
  default     = []
}

variable "security_group_ids" {
  type        = list(string)
  description = "The VPC security groups assigned to the Lambda."
  default     = []
}

variable "datadog_log_subscription_arn" {
  description = "Log subscription arn for shipping logs to datadog"
  default     = ""
}

variable "lambda_role_policy" {
  description = "The Lambda IAM Role Policy."
  default     = <<END
{
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "arn:aws:logs:*:*:*"
    }
  ]
}
END

}

variable "timeout" {
  description = "The maximum time in seconds that the Lambda can run for."
  default     = 3
}

variable "memory_size" {
  description = "Amount of memory in MB your Lambda Function can use at runtime."
  default     = 128
}

variable "lambda_env" {
  description = "Environment parameters passed to the Lambda function."
  type        = map(string)
  default     = {}
}

variable "log_subscription_filter" {
  description = "Subscription filter to filter logs sent to datadog"
  default     = ""
}

variable "reserved_concurrent_executions" {
  description = "Reserved concurrent executions for this Lambda"
  default     = -1
}

variable "tags" {
  description = "A mapping of tags to assign to this lambda function."
  type        = map(string)
  default     = {}
}
