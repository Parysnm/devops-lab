output "api_url" {
  description = "URL de l'API Gateway"
  value       = aws_api_gateway_stage.prod.invoke_url
}

