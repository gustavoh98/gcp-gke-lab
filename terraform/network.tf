# Cria a VPC dedicada pro cluster GKE
resource "google_compute_network" "vpc" {
  name                    = "${var.prefix}-vpc" # nome da VPC no GCP
  auto_create_subnetworks = false               # desativa criação automática de subnets — controlamos manualmente
}

# Cria a subnet dentro da VPC com ranges de IP para Nodes, Pods e Services
resource "google_compute_subnetwork" "subnet" {
  name          = "${var.prefix}-subnet" # nome da subnet no GCP
  ip_cidr_range = "10.0.0.0/24"         # range principal — IPs dos Nodes (VMs)
  region        = var.region             # região onde a subnet vai existir
  network       = google_compute_network.vpc.id # vincula à VPC criada acima

  # Range secundário para os Pods — cada Pod recebe um IP desse range
  secondary_ip_range {
    range_name    = "pods-range"
    ip_cidr_range = "10.48.0.0/14"
  }

  # Range secundário para os Services — cada Service recebe um IP desse range
  secondary_ip_range {
    range_name    = "services-range"
    ip_cidr_range = "10.52.0.0/20"
  }
}