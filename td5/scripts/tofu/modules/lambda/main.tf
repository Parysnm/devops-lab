# Vérifie si le rôle existe déjà
data "aws_iam_role" "existing_lambda_role" {
  name = "lambda-sample-role"
}

# Vérifie si le rôle existe en utilisant `try()` pour éviter l'échec si le rôle n'existe pas encore
locals {
  role_exists = try(data.aws_iam_role.existing_lambda_role.arn, null) != null
}

# Si le rôle n'existe pas, Terraform va le créer
resource "aws_iam_role" "lambda_exec" {
  count = local.role_exists ? 0 : 1  # Crée le rôle uniquement s'il n'existe pas

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

# Attache la politique AWS de base pour Lambda uniquement si le rôle a été créé
resource "aws_iam_policy_attachment" "lambda_policy" {
  count = local.role_exists ? 0 : 1

  name       = "${var.name}-policy-attachment"
  roles      = [aws_iam_role.lambda_exec[0].name]
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# Vérifie si la fonction Lambda existe déjà
data "aws_lambda_function" "existing_lambda" {
  function_name = var.name
}

# Crée ou met à jour la fonction Lambda
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

  role = local.role_exists ? data.aws_iam_role.existing_lambda_role.arn : aws_iam_role.lambda_exec[0].arn

  # Gère la mise à jour sans supprimer et recréer la Lambda
  lifecycle {
    create_before_destroy = true
    ignore_changes        = [function_name, role]
  }

  depends_on = [aws_iam_role.lambda_exec]
}
