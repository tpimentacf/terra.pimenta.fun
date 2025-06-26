resource "cloudflare_certificate_pack" "fallback-pimenta-fun" {
  zone_id               = cloudflare_zone.zone.id
  certificate_authority = "google"
  cloudflare_branding   = false
  hosts                 = ["fallback.dev.pimenta.fun"]
  type                  = "advanced"
  validation_method     = "txt"
  validity_days         = 90
}

resource "cloudflare_certificate_pack" "target-pimenta-fun" {
  zone_id               = cloudflare_zone.zone.id
  certificate_authority = "google"
  cloudflare_branding   = false
  hosts                 = ["target.dev.pimenta.fun"]
  type                  = "advanced"
  validation_method     = "txt"
  validity_days         = 90
}
//output "zone_cert_validation" {
//  description = "The cert validation"
//  value = "${cloudflare_certificate_pack.devee-accounts-ikea-com-google.validation_records[0].txt_name}  ${cloudflare_certificate_pack.devee-accounts-ikea-com-google.validation_method}  ${cloudflare_certificate_pack.devee-accounts-ikea-com-google.validation_records[0].txt_value}"
//}