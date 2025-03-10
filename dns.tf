//resource "cloudflare_record" "record_root" {
//  zone_id = cloudflare_zone.zone.id
//  name    = "@"
//  content = "34.175.4.150"
//  type    = "A"
//  ttl     = 1
//  proxied = true
//}

resource "cloudflare_record" "record_root" {
  zone_id = cloudflare_zone.zone.id
  name    = "@"
  content = "httpbin.org"
  type    = "CNAME"
  ttl     = 1
  proxied = true
}

resource "cloudflare_record" "record_fallback" {
  zone_id = cloudflare_zone.zone.id
  name    = "fallback.dev.pimenta.fun"
  content = "fallback.org"
  type    = "CNAME"
  ttl     = 1
  proxied = true
}
resource "cloudflare_record" "record_target" {
  zone_id = cloudflare_zone.zone.id
  name    = "target.dev.pimenta.fun"
  content = "fallback.dev.pimenta.fun"
  type    = "CNAME"
  ttl     = 1
  proxied = true
}

resource "cloudflare_record" "ssl4saas-origin" {
  zone_id = cloudflare_zone.zone.id
  name    = "saas-origin.dev.pimenta.fun"
  content = "httpbin.tpimenta.xyz"
  type    = "CNAME"
  ttl     = 1
  proxied = true
}

resource "cloudflare_record" "saas-origin1" {
  zone_id = cloudflare_zone.zone.id
  name    = "saas-origin1.dev.pimenta.fun"
  content = "httpbin.org"
  type    = "CNAME"
  ttl     = 1
  proxied = true
}

resource "cloudflare_record" "saas-origin2" {
  zone_id = cloudflare_zone.zone.id
  name    = "saas-origin2.dev.pimenta.fun"
  content = "httpbin.tpimenta.xyz"
  type    = "CNAME"
  ttl     = 1
  proxied = true
}

resource "cloudflare_record" "saas-origin3" {
  zone_id = cloudflare_zone.zone.id
  name    = "saas-origin3.dev.pimenta.fun"
  content = "httpbin.tpimenta.xyz"
  type    = "CNAME"
  ttl     = 1
  proxied = true
}
