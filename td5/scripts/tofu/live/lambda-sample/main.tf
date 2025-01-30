provider "aws" {
  region = "us-east-2" # Replace with your desired region
}

module "oidc_provider" {
  source       = "github.com/Parysnm/devops-lab//td5/scripts/tofu/modules/github-aws-oidc"
  provider_url = "https://token.actions.githubusercontent.com"
}
module "iam_roles" {
  source = "github.com/Parysnm/devops-lab//td5/scripts/tofu/modules/gh-actions-iam-roles"

  name              = "lambda-sample"
  oidc_provider_arn = module.oidc_provider.oidc_provider_arn

  enable_iam_role_for_testing = true
  enable_iam_role_for_plan    = true  # Add for plan role
  enable_iam_role_for_apply   = true  # Add for apply role

  # Remplace avec ton propre repo GitHub
  github_repo = "Parysnm/devops-lab"

  # Remplace avec tes valeurs AWS pour la gestion d'état OpenTofu
  tofu_state_bucket         = "fundamentals-of-devops-tofu-state-parys-alexandre"
  tofu_state_dynamodb_table = "fundamentals-of-devops-tofu-state-parys-alexandre"
}

