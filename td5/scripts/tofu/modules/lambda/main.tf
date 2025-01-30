resource "aws_lambda_function" "this" {
  function_name = var.name
  runtime       = var.runtime
  handler       = var.handler

  memory_size = var.memory_size
  timeout     = var.timeout

  environment {
    variables = var.environment_variables
  }

  # Spécifie l'archive ZIP du code source
  filename         = "${var.src_dir}/lambda.zip"
  source_code_hash = filebase64sha256("${var.src_dir}/lambda.zip")

  role = aws_iam_role.lambda_exec.arn  # Lien avec le rôle IAM
}

# Crée le rôle IAM nécessaire pour exécuter la Lambda
resource "aws_iam_role" "lambda_exec" {
  name = "${var.name}-role"

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

# Attache la politique AWS de base pour Lambda
resource "aws_iam_policy_attachment" "lambda_policy" {
  name       = "${var.name}-policy-attachment"
  roles      = [aws_iam_role.lambda_exec.name]
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}
