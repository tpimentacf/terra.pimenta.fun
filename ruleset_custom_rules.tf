# Custom rule to a Zone-level WAF with tag-based overrides
resource "cloudflare_ruleset" "zone_custom_rules" {
  zone_id     = cloudflare_zone.zone.id
  name        = "Terraform zone-level custom rules"
  description = "Terraform zone-level custom rules"
  kind        = "zone"
  phase       = "http_request_firewall_custom"

  rules {
    action      = "block"
    expression  = "(http.host wildcard \"terraform.pimenta.fun\" and ip.geoip.country ne \"PT\")"
    description = "Block requests from country PT"
    enabled     = true
  }
  rules {
    action      = "block"
    expression  = "(http.request.uri.query contains \"SELECT\" and http.request.uri.query contains \"FROM\")"
    description = "Block SQL Injection attempts"
    enabled     = true
  }

  rules {
    description = "Block Access to path /resources/* if method not GET"
    enabled     = true
    expression  = "(http.request.uri.path eq \"/guesttokens\" and not http.request.method in {\"GET\"})"
    action      = "block" // Default response code 403
  }

}