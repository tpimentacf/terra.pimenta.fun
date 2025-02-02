provider "cloudflare" {}
// api_key = CLOUDFLARE_API_TOKEN //api_token = "gREIDSjj4l6-r-ekNluVFjQcwzbsMjke0BkHVAGw"
//}

resource "cloudflare_zone" "zone" {
  account_id = var.cloudflare_account_tag
  paused     = false
  zone       = var.cloudflare_zone_name
  type       = var.cloudflare_zone_type
  plan       = var.cloudflare_zone_plan
  jump_start = false
}

//output "zone_validation_record" {
//  description = "The Zone verification key"
//  value = "cloudflare-verify.${cloudflare_zone.zone.zone}  TXT  ${cloudflare_zone.zone.verification_key}"
//}

resource "cloudflare_zone_settings_override" "zone-settings" {
  zone_id = cloudflare_zone.zone.id
  settings {
    always_use_https      = "on"
    browser_check         = "on"
    http2                 = "on"
    h2_prioritization     = "off"
    http3                 = "off"
    image_resizing        = "on"
    ip_geolocation        = "on"
    ipv6                  = "on"
    mirage                = "on"
    ssl                   = "full"
    tls_1_3               = "zrt"
    true_client_ip_header = "on"
    universal_ssl         = "off"
    websockets            = "on"
    zero_rtt              = "on"
    min_tls_version       = "1.2"
  }
}

resource "cloudflare_argo" "argo" {
  zone_id       = cloudflare_zone.zone.id
  smart_routing = "on"
}

resource "cloudflare_tiered_cache" "tiered-cache" {
  zone_id    = cloudflare_zone.zone.id
  cache_type = "generic"
}

resource "cloudflare_regional_tiered_cache" "regional-tiered-cache" {
  zone_id = cloudflare_zone.zone.id
  value   = "on"
}

resource "cloudflare_url_normalization_settings" "url-normalization" {
  zone_id = cloudflare_zone.zone.id
  scope   = "both"
  type    = "cloudflare"
}

resource "cloudflare_bot_management" "bot-management" {
  zone_id                = cloudflare_zone.zone.id
  ai_bots_protection     = "disabled"
  auto_update_model      = true
  enable_js              = false
  suppress_session_score = false
}
