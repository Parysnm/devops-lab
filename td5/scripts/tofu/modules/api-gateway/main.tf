resource "aws_api_gateway_rest_api" "this" {
  name        = var.name
  description = "API Gateway for ${var.name}"
}

