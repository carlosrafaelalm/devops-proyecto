variable "environment" {
    type        = string
  description = "Ambiente: dev, staging o prod"
  default     = "dev"
}

variable "location" {
  type        = string
  description = "Región de Azure"
  default     = "canadacentral"
}

variable "node_count" {
  type        = number
  description = "Número de nodos del AKS"
  default     = 2
}
