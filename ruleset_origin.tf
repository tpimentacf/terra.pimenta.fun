##Origin Rules
# Change origin hostname for an specific path
resource "cloudflare_ruleset" "http_origin_example" {
  zone_id     = cloudflare_zone.zone.id
  name        = "Rewrite Origin Rules"
  description = "Rewrite Origin Rules"
  kind        = "zone"
  phase       = "http_request_origin"

  rules {
    expression  = "(http.request.uri.path matches \"^/neworigin/*\")"
    description = "Change origin to some.host for paths containing /neworigin/*"
    enabled     = false
    action      = "route"
    action_parameters {
      host_header = "sub1.terra.pimenta.fun"
      origin {
        host = "sub1.terra.pimenta.fun"
        port = 443
      }
    }
  }

  rules {
    action = "route"
    description = "Rewrite requests to fetch from R2 bucket"
    enabled     = true
    expression  = "(starts_with(http.request.uri.path, \"/resources/\") and http.host ne \"r2.terra.pimenta.fun\")"
    action_parameters {
      host_header = "r2.terra.pimenta.fun"
      origin {
        host = "r2.terra.pimenta.fun"
      }
      sni {
        value = "r2.terra.pimenta.fun"
      }
    }
  }
}
