##Transform Rules
# Rewrite the URI path component to a static path
resource "cloudflare_ruleset" "transform_uri_rule_path" {
  zone_id     = cloudflare_zone.zone.id
  name        = "Transform Rules"
  description = "Transform Rules - zone level"
  kind        = "zone"
  phase       = "http_request_transform"

  rules {
    action = "rewrite"
    expression  = "(http.host eq \"terraforma.pimenta.fun\" and http.request.uri.path eq \"/old-path\")"
    description = "example URI path transform rule"
    enabled     = true
    action_parameters {
      uri {
        path {
          value = "/my-new-route"
        }
      }
    }
  }

  rules {
    action     = "rewrite"
    expression = "(starts_with(http.request.uri.path, \"/resources/\") and http.host ne \"r2.terraforma.pimenta.fun\")"
    description = "Rewrite path"
    enabled    = false
    action_parameters {
      uri {
        path {
          expression = "concat(\"https://r2.terraforma.pimenta.fun\", http.request.uri.path)"
        }
      }
    }
  }
}

# Modify Request HTTP headers to a modified values
resource "cloudflare_ruleset" "transform_uri_http_headers" {
  zone_id     = cloudflare_zone.zone.id
  name        = "Transform rule for HTTP headers"
  description = "modify HTTP headers before reaching origin"
  kind        = "zone"
  phase       = "http_request_late_transform"

  rules {
    expression  = "(http.host eq \"httpbin.terraforma.pimenta.fun\" and http.request.uri.path eq \"/headers\")"
    description = "example request header transform rule"
    enabled     = true
    action      = "rewrite"
    action_parameters {
      headers {
        name      = "cname-api-key"
        operation = "set"
        value     = "8082c85f9e42c67bb27d8995a3ea455841af6c6c71b563211cee61a04a4b812e"
      }
      headers {
        name       = "example-http-header-2"
        operation  = "set"
        expression = "http.request.uri.path" //"cf.zone.name"
      }
      headers {
        name      = "example-http-header-3-to-remove"
        operation = "remove"
      }
    }
  }

  rules {
    expression  = "(http.host eq \"sub.terraforma.pimenta.fun\")"
    description = "example request header transform rule"
    enabled     = true
    action      = "rewrite"
    action_parameters {
      headers {
        name      = "cname-api-key"
        operation = "set"
        value     = "a10e89e37295ab7fb9d5eab518a1f01dfd82e2a1a3f56fe24681a251db8055cd"
      }
    }
  }
}