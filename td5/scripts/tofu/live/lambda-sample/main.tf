provider "aws" {
  region = "us-east-2"  # Remplace par ta région AWS
}

module "lambda_function" {
  source  = "github.com/Parysnm/devops-lab.git//td5/scripts/tofu/live/lambda-sample?ref=opentofu-tests"

  name    = "lambda-sample"
  src_dir = "${path.module}/src"
  runtime = "nodejs20.x"
  handler = "index.handler"
  memory_size = 128
  timeout     = 5

  environment_variables = {
    NODE_ENV = "production"
  }
}
