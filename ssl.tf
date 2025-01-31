
// Configure HTTPS settings
resource "cloudflare_zone_settings_override" "example-com-settings" {
  zone_id = cloudflare_zone.zone.id

  settings {
    tls_1_3                  = "on"
    automatic_https_rewrites = "on"
    ssl                      = "strict"
  }
}