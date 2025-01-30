output "lambda_arn" {
  description = "ARN d'invocation de la fonction Lambda"
  value       = aws_lambda_function.this.invoke_arn  # ✅ Vérifie bien que c'est `invoke_arn`
}
