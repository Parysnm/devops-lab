output "lambda_arn" {
  description = "ARN d'invocation de la fonction Lambda"
  value       = "${aws_lambda_function.this.arn}/invocations"
}


