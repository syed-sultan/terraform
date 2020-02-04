resource "random_id" "instance_id" {
  byte_length = 8
}

// Create VPC
resource "google_compute_network" "vpc" {
  name                    = "fwd-${var.environment}-network"
  auto_create_subnetworks = "false"
  routing_mode = "REGIONAL"
}

// Create Subnet
resource "google_compute_subnetwork" "subnet" {
  name          = "fwd-${var.environment}-subnet"
  ip_cidr_range = cidrsubnet(var.ip_cidr_range[var.environment],4,0)
  network       = google_compute_network.vpc.self_link
  depends_on    = [google_compute_network.vpc]
  region      = var.region
  private_ip_google_access = true
 
//  secondary_ip_range {
//    range_name = "public-services"
//    ip_cidr_range = cidrsubnet(var.ip_cidr_range[var.environment],4,0)
//  }
}

// VPC firewall configuration
resource "google_compute_firewall" "firewall" {
  name    = "fwd-${var.environment}-firewall"
  network = "${google_compute_network.vpc.name}"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22","27017"]
  }

  source_ranges = ["0.0.0.0/0"]
  source_tags = ["${var.environment}-firewall"]
}

resource "google_compute_instance" "vm_instance" {
  name         = "fwd-${var.environment}-vm-${random_id.instance_id.hex}"
//  name         = "fwd-${var.environment}-vm-7598770fe36dc97f"
  machine_type = var.vm_instance_types[var.environment]
  zone = "${var.region}-a"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network    = "${google_compute_network.vpc.self_link}"
    subnetwork = "${google_compute_subnetwork.subnet.name}" 
    access_config {
    }
  }
}
