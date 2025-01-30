provider "aws" {
  region = "us-east-2"
}

module "function" {
  source = "../../modules/lambda"  # Utilisation du chemin relatif vers le module lambda

  name     = var.name
  src_dir  = "${path.module}/src"
  runtime  = "nodejs20.x"
  handler  = "index.handler"

  memory_size = 128
  timeout     = 5

  environment_variables = {
    NODE_ENV = "production"
  }
}

module "gateway" {
  source = "../../modules/api-gateway"  # Utilisation du chemin relatif vers le module api-gateway

  name              = var.name
  function_arn      = module.function.function_arn
  api_gateway_routes = ["GET /"]
}

