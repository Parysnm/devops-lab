output "api_gateway_url" {
  description = "L'URL de l'API Gateway"
  value       = aws_api_gateway_stage.prod.invoke_url
}



