resource "cloudflare_record" "record_root" {
  zone_id = cloudflare_zone.zone.id
  name    = "@"
  content = "34.175.4.150"
  type    = "A"
  ttl     = 1
  proxied = true
}

resource "cloudflare_record" "record_1" {
  zone_id = cloudflare_zone.zone.id
  name    = "www"
  content = "34.175.4.200"
  type    = "A"
  ttl     = 1
  proxied = true
}

resource "cloudflare_record" "record_2" {
  zone_id = cloudflare_zone.zone.id
  name    = "sub"
  content = "34.175.4.200"
  type    = "A"
  ttl     = 1
  proxied = true
}

resource "cloudflare_record" "record_3" {
  zone_id = cloudflare_zone.zone.id
  name    = "httpbin"
  content = "httpbin.org"
  type    = "CNAME"
  ttl     = 1
  proxied = true
}

resource "cloudflare_record" "record_txt1" {
  zone_id = cloudflare_zone.zone.id
  name    = "terra.pimenta.fun"
  type    = "TXT"
  content = "v=spf1 mx a:mail103.pimenta.fun include:spf.protection.outlook.com -all"
  ttl     = 3600
  proxied = false
}