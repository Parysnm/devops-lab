resource "aws_lambda_function" "this" {
  function_name = var.name
  handler       = var.handler
  runtime       = var.runtime
  role          = var.iam_role_arn
  filename      = "${path.module}/lambda.zip"

  environment {
    variables = var.environment_variables
  }
}
