output "lambda_function_name" {
  description = "Nom de la fonction Lambda"
  value       = aws_lambda_function.this.function_name
}

output "lambda_arn" {
  description = "ARN de la fonction Lambda"
  value       = aws_lambda_function.this.arn
}
