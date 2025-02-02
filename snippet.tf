//Maintenance_Page_from_different_endpoint
resource "cloudflare_snippet" "my_snippet" {
  zone_id     = cloudflare_zone.zone.id
  name        = "my_test_snippet_1"
  main_module = "snippet.js"
  files {
    name    = "snippet.js"
    content = file("snippet.js")
  }
}

resource "cloudflare_snippet_rules" "path_snippet_rule" {
  zone_id = cloudflare_zone.zone.id
  rules {
    enabled      = true
    expression   = "http.host eq \"terraforma.pimenta.fun\" and http.request.uri.path eq \"/snippet\""
    description  = "Trigger snippet on specific host & path"
    snippet_name = "my_test_snippet_1"
  }
  depends_on = [cloudflare_snippet.my_snippet]
}