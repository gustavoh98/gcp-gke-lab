# Exibe o nome do cluster após o apply — útil para confirmar o que foi criado
output "cluster_name" {
  value = google_container_cluster.primary.name
}

# Exibe o IP do API Server — marcado como sensitive para não aparecer em texto puro
output "cluster_endpoint" {
  value     = google_container_cluster.primary.endpoint
  sensitive = true
}