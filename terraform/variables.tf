variable "environment" {
  type        = string
  description = "Ambiente: dev, staging o prod"
  default     = "dev"
}

variable "location" {
  type        = string
  description = "Región de Azure"
  default     = "eastus"
}

variable "node_count" {
  type        = number
  description = "Número de nodos del AKS"
  default     = 2
}

variable "vm_size" {
  type        = string
  description = "Tamaño de la máquina virtual del AKS"
  default     = "Standard_b2s_v2"
}
 