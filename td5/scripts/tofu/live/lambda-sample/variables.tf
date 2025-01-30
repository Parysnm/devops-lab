variable "environment_variables" {
  description = "Variables d'environnement pour la Lambda"
  type        = map(string)
  default = {
    NODE_ENV = "production"
  }
}
