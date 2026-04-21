# Define o provider necessário para o Terraform se comunicar com o GCP
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google" 
      version = "~> 5.0"           
    }
  }
}

# Configura o provider Google com as credenciais e localização padrão
provider "google" {
  project = var.project_id # ID do projeto GCP onde os recursos serão criados
  region  = var.region     # região padrão para os recursos
  zone    = var.zone       # zona padrão para os recursos
}