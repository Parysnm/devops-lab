provider "aws" {
  region = "us-east-2"
}

module "function" {
  source  = "github.com/Parysnm/devops-lab//td5/scripts/tofu/live/lambda-sample"

  name    = var.name
  src_dir = var.src_dir
  runtime = var.runtime
  handler = var.handler
  memory_size = var.memory_size
  timeout     = var.timeout

  environment_variables = var.environment_variables
}
