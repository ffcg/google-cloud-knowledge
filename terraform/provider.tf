terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

provider "google" {
  project = var.google_cloud_project_name
  region  = var.region
  zone    = var.zone
}