resource "cloudflare_r2_bucket" "r2bucket-dev" {
  account_id = var.cloudflare_account_tag
  name       = "r2bucket-dev"
  location   = "ENAM"
}