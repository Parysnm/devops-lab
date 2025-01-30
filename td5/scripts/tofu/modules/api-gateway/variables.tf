variable "name" {
  description = "Nom de l'API Gateway"
  type        = string
}

variable "lambda_function_name" {
  description = "Nom de la fonction Lambda à connecter"
  type        = string
}

variable "lambda_invoke_arn" {
  description = "ARN d'invocation de la Lambda"
  type        = string
}
