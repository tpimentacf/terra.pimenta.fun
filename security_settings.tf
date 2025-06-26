# Enable the Leaked Credentials Check detection
resource "cloudflare_leaked_credential_check" "leaked_credential" {
  zone_id = cloudflare_zone.zone.id
  enabled = true
}

# Create a ruleset for the http_response_firewall_managed phase
resource "cloudflare_ruleset" "sensitive_data_detection" {
  zone_id     = cloudflare_zone.zone.id
  name        = "Sensitive Data Detection"
  description = "Execute Cloudflare Sensitive Data Detection managed ruleset"
  kind        = "zone"
  phase       = "http_response_firewall_managed"

  rules {
    action  = "execute"
    enabled = "true"
    action_parameters {
      id = "e22d83c647c64a3eae91b71b499d988e" # ID for Sensitive Data Detection ruleset
    }
    expression  = "true"
    description = "Execute Sensitive Data Detection ruleset"
  }
}