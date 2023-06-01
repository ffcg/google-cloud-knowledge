locals {
  root_dir = "../"
  public_folder = "public"
}

# Create bucket
resource "google_storage_bucket" "static_website" {
  name          = "${var.google_cloud_project_name}-static-website-bucket"
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

# Upload files from public folder to storage bucket.
# On the content parameter the templatefile will update the storage_bucket_name variable with the bucket name in the index.html file located in the public folder.
resource "google_storage_bucket_object" "static_website" {
  for_each      = fileset("${local.root_dir}${local.public_folder}", "**")
  name          = each.key
  content       = templatefile("${local.root_dir}${local.public_folder}/${each.key}", {storage_bucket_name: google_storage_bucket.static_website.name})
  bucket        = google_storage_bucket.static_website.name
  cache_control = "no-store"
}

# Upload README file to bucket
resource "google_storage_bucket_object" "readme" {
  name   = "README.md"
  source = "${local.root_dir}README.md"
  bucket = google_storage_bucket.static_website.name
}

# Make bucket publicy accessed on internet
resource "google_storage_bucket_iam_member" "member" {
  bucket = google_storage_bucket.static_website.name
  role   = "roles/storage.objectViewer"
  member = "allUsers"
}