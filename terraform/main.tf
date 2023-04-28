locals {
  root_dir = "../public/"
  repo_name = "static-website"
}

data "google_project" "project" {}

# Create bucket
resource "google_storage_bucket" "static_website" {
  name          = "${var.gcp_project_name}-static-website-bucket"
  location      = var.location
  storage_class = "STANDARD"
  force_destroy = true

  uniform_bucket_level_access = true

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
  cors {
    origin          = ["*"]
    method          = ["GET"]
    response_header = ["*"]
    max_age_seconds = 3600
  }
}

# Upload files from public folder to storage bucket
resource "google_storage_bucket_object" "static_website" {
  for_each      = fileset(local.root_dir, "**")
  name          = each.key
  source        = "${local.root_dir}${each.key}"
  bucket        = google_storage_bucket.static_website.name
  cache_control = "no-store"
}

resource "google_storage_bucket_iam_member" "member" {
  bucket = google_storage_bucket.static_website.name
  role   = "roles/storage.objectViewer"
  member = "allUsers"
}

resource "google_service_account" "cloudbuild_service_account" {
  account_id = var.cloud_build_service_account_id
}

resource "google_project_iam_member" "memeber_role_cloud_build" {
  for_each = toset([
    "roles/iam.serviceAccountUser",
    "roles/logging.logWriter",
    "roles/source.reader",
    "roles/storage.admin",
  ])
  role    = each.key
  member  = "serviceAccount:${google_service_account.cloudbuild_service_account.email}"
  project = data.google_project.project.project_id
}

resource "google_sourcerepo_repository" "repository" {
  name = local.repo_name
}

resource "google_cloudbuild_trigger" "service-account-trigger" {
  trigger_template {
    branch_name = "main"
    repo_name   = local.repo_name
  }

  service_account = google_service_account.cloudbuild_service_account.id
  filename        = "cloudbuild.yaml"
}