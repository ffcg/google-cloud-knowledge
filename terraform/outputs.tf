output "public_url" {
  value = "https://storage.googleapis.com/${google_storage_bucket.static_website.name}/${google_storage_bucket.static_website.website[0].main_page_suffix}"
}