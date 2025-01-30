module "lambda_function" {
  source  = "github.com/Parysnm/devops-lab//td5/scripts/tofu/live/lambda-sample"

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
