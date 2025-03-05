resource "cloudflare_turnstile_widget" "example" {
  account_id = var.cloudflare_account_tag
  name       = "CIAM Inter-managed widget"
  domains    = ["dev.pimenta.fun"]
  mode       = "managed"
}

output "turnstile_example_sitekey" {
  description = "Sitekey"
  value       = cloudflare_turnstile_widget.example.id
}

output "turnstile_example_secretkey" {
  description = "Secret key"
  value       = cloudflare_turnstile_widget.example.secret
  sensitive   = true
}