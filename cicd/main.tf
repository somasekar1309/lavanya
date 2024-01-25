# creating the vpc and subnet
resource "google_compute_network" "vpc_network" {
  project                                   = var.gcp_project
  name                                      = var.gcp_project
  auto_create_subnetworks                   = false
}
# creating the subnet
resource "google_compute_subnetwork" "subnet_network" {
  name          = "new-subnetwork"
  ip_cidr_range = "10.2.0.0/23"
  region        = var.gcp_regions[0]
  network       = google_compute_network.vpc_network.self_link
}
