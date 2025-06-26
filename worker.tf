resource "cloudflare_workers_script" "server_check" {
  account_id = var.cloudflare_account_tag
  name       = "worker-server-header"
  content    = file("worker.js") # Ensure this file contains the above JavaScript code
}

resource "cloudflare_workers_route" "server_check_route" {
  zone_id     = cloudflare_zone.zone.id
  pattern     = "*.pimenta.fun/*" # Apply to all subdomains
  script_name = cloudflare_workers_script.server_check.name
}