//resource "cloudflare_record" "record_root" {
//  zone_id = cloudflare_zone.zone.id
//  name    = "@"
//  content = "34.175.4.150"
//  type    = "A"
//  ttl     = 1
//  proxied = true
//}

resource "cloudflare_record" "record_fallback" {
  zone_id = cloudflare_zone.zone.id
  name    = "fallback.dev.pimenta.fun"
  content = "httpbin.org"
  type    = "CNAME"
  ttl     = 1
  proxied = true
}

resource "cloudflare_record" "record_dev" {
  zone_id = cloudflare_zone.zone.id
  name    = "dev.pimenta.fun"
  content = "fallback.dev.pimenta.fun"
  type    = "CNAME"
  ttl     = 1
  proxied = true
}

resource "cloudflare_record" "record_dev1" {
  zone_id = cloudflare_zone.zone.id
  name    = "dev1.pimenta.fun"
  content = "fallback.dev.pimenta.fun"
  type    = "CNAME"
  ttl     = 1
  proxied = true
}

resource "cloudflare_record" "record_dev2" {
  zone_id = cloudflare_zone.zone.id
  name    = "dev2.tpimenta.xyz"
  content = "fallback.dev.pimenta.fun"
  type    = "CNAME"
  ttl     = 1
  proxied = true
}