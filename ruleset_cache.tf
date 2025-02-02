variable "file_extensions" {
  default = ["css", "js"]
}

# Page rule to define cache TTL 
resource "cloudflare_page_rule" "cache_ttl_css_js" {
  zone_id  = cloudflare_zone.zone.id
  target   = "api.terraform.pimenta.fun/*.{${join(",", var.file_extensions)}}" # "example.com/*.{jpg,jpeg,png,gif,css,js}" # Group of extensions
  priority = 1
  actions {
    cache_level       = "cache_everything"
    edge_cache_ttl    = 604800
    browser_cache_ttl = 604800
  }
}

# Cache rule configuring cache settings and defining custom cache keys
resource "cloudflare_ruleset" "cache_rules_example" {
  zone_id     = cloudflare_zone.zone.id
  name        = "Set cache settings"
  description = "Set cache settings for incoming requests with file extensions eot aviv"
  kind        = "zone"
  phase       = "http_request_cache_settings"

  rules {
    ref         = "cache_settings_custom_cache_key"
    description = "Set cache settings and custom cache key for example.net"
    expression  = "(http.host eq \"example.net\" and http.request.uri.path.extension in {\"eot\" \"aviv\"})"
    action      = "set_cache_settings"
    action_parameters {
      edge_ttl {
        mode    = "override_origin"
        default = 60
        status_code_ttl {
          status_code = 200
          value       = 50
        }
        status_code_ttl {
          status_code_range {
            from = 201
            to   = 300
          }
          value = 30
        }
      }
      browser_ttl {
        mode = "respect_origin"
      }
      serve_stale {
        disable_stale_while_updating = true
      }
      respect_strong_etags       = true
      origin_error_page_passthru = false
    }
  }
}