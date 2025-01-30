provider "aws" {
  region = "us-east-2"
}

module "state" {
  source = "github.com/Parysnm/devops-lab//td5/scripts/tofu/modules/state-bucket"

  # TODO: fill in your own bucket name!
  name = "fundamentals-of-devops-tofu-state-parys-alexandre"
}