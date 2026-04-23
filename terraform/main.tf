# Cria o cluster GKE — é o "cérebro" que vai orquestrar os containers
resource "google_container_cluster" "primary" {
  name     = var.cluster_name  # nome do cluster no GCP
  location = var.zone          # zona onde o cluster vai rodar

  network    = google_compute_network.vpc.id        # VPC criada no network.tf
  subnetwork = google_compute_subnetwork.subnet.id  # subnet criada no network.tf

  remove_default_node_pool = true  # remove o node pool padrão — vou criar abaixo
  initial_node_count       = 1     # obrigatório mesmo removendo o default
  deletion_protection = false # permite deletar o cluster sem precisar desabilitar proteção manualmente
  
  # Define os ranges de IP para Pods e Services dentro do cluster
  ip_allocation_policy {
    cluster_secondary_range_name  = "pods-range"     # range secundário dos Pods
    services_secondary_range_name = "services-range" # range secundário dos Services
  }
}

# Cria o node pool — as VMs que vão rodar os Pods de verdade
resource "google_container_node_pool" "primary_nodes" {
  name       = "${var.cluster_name}-node-pool"       # nome do node pool
  cluster    = google_container_cluster.primary.name # vincula ao cluster acima
  location   = var.zone
  node_count = var.node_count                        # qtd de nodes (VMs)

  node_config {
    machine_type = var.machine_type  # tipo da VM — e2-medium
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform", # permissão pra acessar APIs do GCP
    ]
  }
}