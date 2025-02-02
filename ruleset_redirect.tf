# Dynamic Redirects from value resource
resource "cloudflare_ruleset" "redirect_from_value_example" {
  zone_id     = cloudflare_zone.zone.id
  name        = "redirects"
  description = "Redirect ruleset"
  kind        = "zone"
  phase       = "http_request_dynamic_redirect"

  rules {
    expression  = "(http.request.uri.path matches \"^/api/\")"
    description = "Apply redirect from value to newpath"
    enabled     = true
    action      = "redirect"
    action_parameters {
      from_value {
        status_code = 301
        target_url {
          value = "api.terraforma.pimenta.fun/newpath"
        }
        preserve_query_string = true
      }
    }
  }

  # Dynamic Redirects from value with concatenated domain and path
  rules {
    description = "Dynamic Redirects from value with concatenated domain and path"
    enabled     = true
    expression  = "(http.host matches \"(httpbin.|)terraforma.pimenta.fun\") and (http.request.uri.path.extension eq \"png\")"
    action      = "redirect"
    action_parameters {
      from_value {
        preserve_query_string = true
        status_code           = 301
        target_url {
          expression = "concat(\"https://newdomain.com/new-path\", http.request.uri.path)"
        }
      }
    }
  }

}
