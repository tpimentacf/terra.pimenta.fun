resource "cloudflare_r2_bucket" "r2bucket" {
  account_id = var.cloudflare_account_tag
  name       = "r2bucket"
  location   = "ENAM"
}