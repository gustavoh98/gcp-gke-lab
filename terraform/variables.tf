# ID do projeto GCP — sem default porque muda por ambiente, definido no tfvars
variable "project_id" {
  description = "ID do projeto no GCP"
  type        = string
}

# Região padrão onde os recursos serão criados
variable "region" {
  description = "Região GCP"
  type        = string
  default     = "southamerica-east1"
}

# Zona específica dentro da região — usada pelo cluster e node pool
variable "zone" {
  description = "Zona GCP"
  type        = string
  default     = "southamerica-east1-b"
}

# Prefixo usado para nomear todos os recursos — facilita identificar no console
variable "prefix" {
  description = "Prefixo para nomear recursos"
  type        = string
  default     = "gke-lab"
}

# Nome do cluster GKE
variable "cluster_name" {
  description = "Nome do cluster GKE"
  type        = string
  default     = "gke-lab-cluster"
}

# Tipo de máquina dos nodes do cluster GKE
variable "machine_type" {
  description = "Tipo de máquina para os nós do cluster GKE"
  type        = string
  default     = "e2-medium"
}

# Quantidade de nodes no pool do cluster GKE
variable "node_count" {
  description = "Número de nós no cluster GKE"
  type        = number
  default     = 1
}