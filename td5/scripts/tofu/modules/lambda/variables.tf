variable "name" {
  description = "Nom de la fonction Lambda"
  type        = string
}

variable "src_dir" {
  description = "Répertoire source de la fonction Lambda"
  type        = string
}

variable "runtime" {
  description = "Runtime de la fonction Lambda"
  type        = string
}

variable "handler" {
  description = "Handler de la fonction Lambda"
  type        = string
}

variable "memory_size" {
  description = "Taille de la mémoire allouée à la fonction Lambda"
  type        = number
  default     = 128
}

variable "timeout" {
  description = "Durée maximale d'exécution de la fonction Lambda"
  type        = number
  default     = 5
}

variable "environment_variables" {
  description = "Variables d'environnement pour la fonction Lambda"
  type        = map(string)
  default     = {}
}
