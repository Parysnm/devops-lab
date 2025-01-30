variable "src_dir" {
  description = "Chemin du dossier source"
  type        = string
  default     = "./src"
}

variable "runtime" {
  description = "Runtime de la Lambda"
  type        = string
  default     = "nodejs20.x"
}

variable "handler" {
  description = "Handler de la Lambda"
  type        = string
  default     = "index.handler"
}

variable "memory_size" {
  description = "Mémoire allouée à la Lambda"
  type        = number
  default     = 128
}

variable "timeout" {
  description = "Délai d'exécution"
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
