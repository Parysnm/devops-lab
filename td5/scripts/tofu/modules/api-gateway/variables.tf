variable "name" {
  description = "Nom de l'API Gateway"
  type        = string
}

variable "stage_name" {
  description = "Nom du stage de déploiement"
  type        = string
  default     = "dev"
}

variable "lambda_invoke_arn" {
  description = "ARN de la fonction Lambda à invoquer"
  type        = string
}

variable "http_method" {
  description = "Méthode HTTP utilisée (GET, POST, etc.)"
  type        = string
  default     = "GET"
}

variable "resource_path" {
  description = "Chemin de l'API"
  type        = string
  default     = "/"
}
