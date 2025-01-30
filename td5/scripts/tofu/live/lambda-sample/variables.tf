variable "name" {
  description = "Nom de la fonction Lambda"
  type        = string
}

variable "src_dir" {
  description = "Chemin du dossier source"
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
  description = "Taille mémoire de la Lambda"
  type        = number
}

variable "timeout" {
  description = "Délai d’exécution"
  type        = number
}

variable "environment_variables" {
  description = "Variables d'environnement"
  type        = map(string)
}
