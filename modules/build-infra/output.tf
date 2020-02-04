output "network" {
  description = "A reference (self_link) to the VPC network"
  value       = google_compute_network.vpc.self_link
}

# ---------------------------------------------------------------------------------------------------------------------
# Public Subnetwork Outputs
# ---------------------------------------------------------------------------------------------------------------------

output "public_subnetwork" {
  description = "A reference (self_link) to the public subnetwork"
  value       = google_compute_subnetwork.subnet.self_link
}

output "public_subnetwork_name" {
  description = "Name of the public subnetwork"
  value       = google_compute_subnetwork.subnet.name
}

output "public_subnetwork_cidr_block" {
  value = google_compute_subnetwork.subnet.ip_cidr_range
}

output "public_subnetwork_gateway" {
  value = google_compute_subnetwork.subnet.gateway_address
}

output "vm-ip" {
value = "${google_compute_instance.vm_instance.network_interface.0.access_config.0.nat_ip}"
}
