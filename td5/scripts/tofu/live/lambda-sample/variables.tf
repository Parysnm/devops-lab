variable "name" {
  description = "Nom de la fonction Lambda"
  type        = string
  default     = "lambda-sample"
}

variable "src_dir" {
  description = "Chemin du code source"
  type        = string
  default     = "${path.module}/src"
}

variable "runtime" {
  description = "Runtime utilisé par la Lambda"
  type        = string
  default     = "nodejs20.x"
}

variable "handler" {
  description = "Handler de la fonction Lambda"
  type        = string
  default     = "index.handler"
}

variable "memory_size" {
  description = "Taille mémoire en MB"
  type        = number
  default     = 128
}

variable "timeout" {
  description = "Timeout en secondes"
  type        = number
  default     = 5
}

variable "environment_variables" {
  description = "Variables d'environnement"
  type        = map(string)
  default = {
    NODE_ENV = "production"
  }
}
