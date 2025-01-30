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

variable "routes" {  # ✅ Ajouté pour gérer les routes API
  description = "Liste des routes de l'API Gateway"
  type        = list(string)
  default     = ["GET /"]
}
