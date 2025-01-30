variable "name" {
  description = "Nom de la fonction Lambda"
  type        = string
}

variable "src_dir" {
  description = "Chemin du code source"
  type        = string
}

variable "runtime" {
  description = "Runtime utilisé par la Lambda"
  type        = string
}

variable "handler" {
  description = "Handler de la fonction Lambda"
  type        = string
}

variable "memory_size" {
  description = "Taille mémoire en MB"
  type        = number
}

variable "timeout" {
  description = "Timeout en secondes"
  type        = number
}

variable "environment_variables" {
  description = "Variables d'environnement"
  type        = map(string)
}
