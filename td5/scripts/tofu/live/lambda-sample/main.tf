provider "aws" {
  region = "us-east-2"
}

module "function" {
  source = "github.com/Parysnm/devops-lab//td5/scripts/tofu/modules/lambda?ref=opentofu-tests" # ✅ Correction ici

  name                = var.name
  src_dir             = var.src_dir
  runtime             = var.runtime
  handler             = var.handler
  memory_size         = var.memory_size
  timeout             = var.timeout

  environment_variables = var.environment_variables
}

module "api_gateway" {
  source               = "github.com/Parysnm/devops-lab//td5/scripts/tofu/modules/api-gateway?ref=opentofu-tests"
  name                 = var.name
  lambda_function_name = module.function.lambda_function_name
  lambda_invoke_arn    = module.function.lambda_arn  # ✅ Vérifie bien que cette variable est correcte
}


