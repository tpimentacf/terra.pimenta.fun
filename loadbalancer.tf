# 1. Health Check Monitor
resource "cloudflare_load_balancer_monitor" "app_monitor" {
  account_id     = var.cloudflare_account_tag
  type           = "https"
  path           = "/health"
  expected_codes = "200"
  interval       = 60
  timeout        = 5
  retries        = 2
}

# 2. Primary Pool (US-based)
resource "cloudflare_load_balancer_pool" "us_pool" {
  account_id      = var.cloudflare_account_tag
  description     = "us-pool"
  enabled         = true
  minimum_origins = 1
  name            = "us"
  origins {
    address = "httpbin.tpimenta.xyz"
    enabled = true
    name    = "server-us-2"
    weight  = 1
      header {
      header = "Host"
      values = ["httpbin.tpimenta.xyz"]
    }
  }
}

# 3. Fallback Pool (EU-based)
resource "cloudflare_load_balancer_pool" "eu_pool" {
  account_id      = var.cloudflare_account_tag
  description     = "eu-pool"
  enabled         = true
  minimum_origins = 1
  name            = "eu"
  origins {
    address = "httpbin.tpimenta.xyz"
    enabled = true
    name    = "server-eu-1"
    weight  = 1
    header {
      header = "Host"
      values = ["httpbin.tpimenta.xyz"]
    }
  }
} 

# 4. Load Balancer Configuration
resource "cloudflare_load_balancer" "lb_dev_pimenta_fun" {
  default_pool_ids = [cloudflare_load_balancer_pool.eu_pool.id, cloudflare_load_balancer_pool.us_pool.id]
  enabled          = true
  fallback_pool_id = cloudflare_load_balancer_pool.us_pool.id
  name             = "lb.dev.pimenta.fun"
  proxied          = true
  session_affinity = "ip_cookie"
  session_affinity_ttl = 1800
  steering_policy  = "random"
  zone_id          = cloudflare_zone.zone.id
  adaptive_routing {
    failover_across_pools = false
  }
  location_strategy {
    mode       = "pop"
    prefer_ecs = "proximity"
  }
  random_steering {
    default_weight = 1
    pool_weights = {
      "cloudflare_load_balancer_pool.eu_pool.id" = 0.6
      "cloudflare_load_balancer_pool.us_pool.id" = 0.4
    }
  }
  #https://developers.cloudflare.com/load-balancing/reference/region-mapping-api/#list-of-load-balancer-regions 
  region_pools {
    pool_ids = [cloudflare_load_balancer_pool.us_pool.id]
    region   = "WNAM"
  }
  region_pools {
    pool_ids = [cloudflare_load_balancer_pool.eu_pool.id]
    region   = "WEU"
  }
  session_affinity_attributes {
    samesite               = "Auto"
    secure                 = "Auto"
    zero_downtime_failover = "none"
  }
}

