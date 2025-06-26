resource "cloudflare_turnstile_widget" "example" {
  account_id = var.cloudflare_account_tag
  name       = "CIAM Inter-managed widget"
  domains    = ["dev.pimenta.fun"]
  mode       = "managed"
}


resource "cloudflare_turnstile_widget" "example_turnstile_widget" {
  account_id = var.cloudflare_account_tag
  domains = ["203.0.113.1", "dev.pimenta.fun"]
  mode = "non-interactive"
  name = "dev.pimenta.fun login form"
  bot_fight_mode = false
  #clearance_level = "managed"    # Only supported in version 5.2.0
  #ephemeral_id = false           # Only supported in version 5.2.0
  offlabel = false
  region = "world"
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
