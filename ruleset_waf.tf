# Configure a ruleset at the zone level for the "http_request_firewall_managed" phase
resource "cloudflare_ruleset" "zone_level_managed_waf" {
  zone_id     = cloudflare_zone.zone.id
  name        = "Managed WAF entry point ruleset"
  description = "Zone-level WAF Managed Rules config"
  kind        = "zone"
  phase       = "http_request_firewall_managed"

  # Execute Cloudflare Managed Ruleset
  rules {
    ref         = "execute_cloudflare_managed_ruleset"
    description = "Execute Cloudflare Managed Ruleset on my zone-level phase entry point ruleset"
    expression  = "true"
    action      = "execute"
    action_parameters {
      id = "efb7b8c949ac4650a09736fc376e9aee"
    }
  }

  # Execute Cloudflare OWASP Core Ruleset
  rules {
    ref         = "execute_cloudflare_owasp_core_ruleset"
    description = "Execute Cloudflare OWASP Core Ruleset on my zone-level phase entry point ruleset"
    expression  = "true"
    action      = "execute"
    action_parameters {
      id = "4814384a9e5d4991b9815dcfc25d2f1f"
    }
  }
}