resource "cloudflare_custom_hostname_fallback_origin" "fallback_origin" {
  zone_id = cloudflare_zone.zone.id
  origin  = "fallback.dev.pimenta.fun"
}

resource "cloudflare_custom_hostname" "dev_pimenta_fun" {
  zone_id              = cloudflare_zone.zone.id
  hostname             = "dev.pimenta.fun"
  custom_origin_server = "saas-origin1.dev.pimenta.fun"
  custom_origin_sni    = "dev.pimenta.fun"
  ssl {
    certificate_authority = "google"
    method                = "txt" // email  http
    type                  = "dv"
    settings {
      min_tls_version = "1.2"
    }
  }
}

resource "cloudflare_custom_hostname" "ssl4saas_borbabeerfest_pt" {
  zone_id              = cloudflare_zone.zone.id
  hostname             = "ssl4saas.borbabeerfest.pt"
  custom_origin_server = "saas-origin.dev.pimenta.fun"
  custom_origin_sni    = "ssl4saas.borbabeerfest.pt"
  ssl {
    certificate_authority = "google"
    method                = "txt" // email  http
    settings {
      min_tls_version = "1.2"
    }
  }
}

resource "cloudflare_custom_hostname" "saas_borbabeerfest_pt" {
  zone_id              = cloudflare_zone.zone.id
  hostname             = "saas.borbabeerfest.pt"
  custom_origin_server = "saas-origin1.dev.pimenta.fun"
  custom_origin_sni    = "saas.borbabeerfest.pt"
  ssl {
    certificate_authority = "google"
    method                = "txt" // email  http
    settings {
      min_tls_version = "1.2"
    }
  }
}

resource "cloudflare_custom_hostname" "saas2_borbabeerfest_pt" {
  zone_id              = cloudflare_zone.zone.id
  hostname             = "saas2.borbabeerfest.pt"
  custom_origin_server = "saas-origin2.dev.pimenta.fun"
  custom_origin_sni    = "saas2.borbabeerfest.pt"
  ssl {
    certificate_authority = "google"
    method                = "txt" // email  http
    settings {
      min_tls_version = "1.2"
    }
  }
}

resource "cloudflare_custom_hostname" "saas3_borbabeerfest_pt" {
  zone_id              = cloudflare_zone.zone.id
  hostname             = "saas3.borbabeerfest.pt"
  custom_origin_server = "saas-origin3.dev.pimenta.fun"
  custom_origin_sni    = "saas3.borbabeerfest.pt"
  ssl {
    certificate_authority = "google"
    method                = "txt" // email  http
    settings {
      min_tls_version = "1.2"
    }
  }
}