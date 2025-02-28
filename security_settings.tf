# Enable the Leaked Credentials Check detection
resource "cloudflare_leaked_credential_check" "leaked_credential" {
    zone_id = cloudflare_zone.zone.id
    enabled = true
}