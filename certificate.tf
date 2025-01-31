resource "cloudflare_certificate_pack" "terra-pimenta-fun" {
  zone_id               = cloudflare_zone.zone.id
  certificate_authority = "google"
  cloudflare_branding   = false
  hosts                 = ["terra.pimenta.fun"]
  type                  = "advanced"
  validation_method     = "txt"
  validity_days         = 90
}

resource "cloudflare_certificate_pack" "www-terra-pimenta-fun" {
  zone_id               = cloudflare_zone.zone.id
  certificate_authority = "google"
  cloudflare_branding   = false
  hosts                 = ["www.terra.pimenta.fun"]
  type                  = "advanced"
  validation_method     = "txt"
  validity_days         = 90
}

resource "cloudflare_certificate_pack" "sub-terra-pimenta-fun" {
  zone_id               = cloudflare_zone.zone.id
  certificate_authority = "google"
  cloudflare_branding   = false
  hosts                 = ["sub.terra.pimenta.fun"]
  type                  = "advanced"
  validation_method     = "txt"
  validity_days         = 90
}

resource "cloudflare_certificate_pack" "httpbin-terra-pimenta-fun" {
  zone_id               = cloudflare_zone.zone.id
  certificate_authority = "google"
  cloudflare_branding   = false
  hosts                 = ["httpbin.terra.pimenta.fun"]
  type                  = "advanced"
  validation_method     = "txt"
  validity_days         = 90
}

resource "cloudflare_certificate_pack" "r2-terra-pimenta-fun" {
  zone_id               = cloudflare_zone.zone.id
  certificate_authority = "google"
  cloudflare_branding   = false
  hosts                 = ["r2.terra.pimenta.fun"]
  type                  = "advanced"
  validation_method     = "txt"
  validity_days         = 90
}


# Authenticated Origin Pulls
resource "cloudflare_authenticated_origin_pulls" "my_aop" {
  zone_id = cloudflare_zone.zone.id
  enabled = true
}


//output "zone_cert_validation" {
//  description = "The cert validation"
//  value = "${cloudflare_certificate_pack.devee-accounts-ikea-com-google.validation_records[0].txt_name}  ${cloudflare_certificate_pack.devee-accounts-ikea-com-google.validation_method}  ${cloudflare_certificate_pack.devee-accounts-ikea-com-google.validation_records[0].txt_value}"
//}