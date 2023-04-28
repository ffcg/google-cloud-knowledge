variable "region" {
  type = string
}

variable "location" {
  type = string
}

variable "zone" {
  type = string
}

variable "gcp_project_name" {
  type        = string
  description = "GCP project name"
}

variable "cloud_build_service_account_id" {
  type        = string
  description = "Cloud build service account id"
}