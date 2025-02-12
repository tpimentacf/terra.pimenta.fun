resource "cloudflare_custom_hostname_fallback_origin" "fallback_origin" {
  zone_id = cloudflare_zone.zone.id
  origin  = "fallback.dev.pimenta.fun"
}

resource "cloudflare_custom_hostname" "dev_pimenta_fun" {
  zone_id  = cloudflare_zone.zone.id
  hostname = "dev.pimenta.fun"
  custom_origin_server = "httpbin.org"
  custom_origin_sni = "dev.pimenta.fun"
  ssl {
    certificate_authority = "google"
    method = "txt"  // email  http
    type = "dv"
    settings {
      min_tls_version = "1.2"
    }
  }
}

resource "cloudflare_custom_hostname" "dev1_pimenta_fun" {
  zone_id  = cloudflare_zone.zone.id
  hostname = "dev1.pimenta.fun"
  custom_origin_server = "httpbin.org"
  custom_origin_sni = "dev1.pimenta.fun"
  ssl {
    certificate_authority = "google"
    method = "txt"  // email  http
    type = "dv"
    settings {
      min_tls_version = "1.2"
    }
  }
}

resource "cloudflare_custom_hostname" "dev2_pimenta_xyz" {
  zone_id  = cloudflare_zone.zone.id
  hostname = "dev2.tpimenta.xyz"
  custom_origin_server = "httpbin.org"
  custom_origin_sni = "dev2.tpimenta.xyz"
  ssl {
    certificate_authority = "google"
    method = "txt"  // email  http
    type = "dv"
    settings {
      min_tls_version = "1.2"
    }
  }
}