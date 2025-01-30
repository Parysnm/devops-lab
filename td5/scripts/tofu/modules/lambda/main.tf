# Vérifie si le rôle existe déjà
data "aws_iam_role" "existing_lambda_role" {
  name = "lambda-sample-role"
}

# Si le rôle n'existe pas, Terraform va le créer
resource "aws_iam_role" "lambda_exec" {
  count = length(data.aws_iam_role.existing_lambda_role.name) > 0 ? 0 : 1

  name = "lambda-sample-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

# La fonction Lambda utilise soit le rôle existant, soit celui qui vient d’être créé
resource "aws_lambda_function" "this" {
  function_name = var.name
  runtime       = var.runtime
  handler       = var.handler

  memory_size = var.memory_size
  timeout     = var.timeout

  environment {
    variables = var.environment_variables
  }

  filename         = "${var.src_dir}/lambda.zip"
  source_code_hash = filebase64sha256("${var.src_dir}/lambda.zip")

  role = length(data.aws_iam_role.existing_lambda_role.name) > 0 ? data.aws_iam_role.existing_lambda_role.arn : aws_iam_role.lambda_exec[0].arn
}
