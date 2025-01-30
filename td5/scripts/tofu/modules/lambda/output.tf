output "lambda_function_name" {
  description = "Nom de la fonction Lambda"
  value       = aws_lambda_function.this.function_name
}

output "lambda_arn" {
  description = "ARN d'invocation de la fonction Lambda"
  value       = "${aws_lambda_function.this.invoke_arn}"  # ✅ Utilisation correcte d'`invoke_arn`
}




