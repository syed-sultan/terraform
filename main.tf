terraform {
  # The modules used in this example have been updated with 0.12 syntax, additionally we depend on a bug fixed in
  # version 0.12.7.
  required_version = ">= 0.12.7"
}

// Configure the Google Cloud provider
provider "google" {
  version = "~> 2.9.0"
  credentials = file("${var.credentials}")
  project     = "${var.project_name}"
}

module "build-infra" {
 source = "./modules/build-infra"
}

