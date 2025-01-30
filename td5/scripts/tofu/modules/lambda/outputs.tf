output "function_arn" {
  description = "L'ARN de la fonction Lambda"
  value       = aws_lambda_function.this.arn
}
