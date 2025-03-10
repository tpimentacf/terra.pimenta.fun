resource "cloudflare_logpush_job" "logpush_firewall_events" {
  dataset          = "firewall_events"
  destination_conf = "https://log-api.eu.newrelic.com/log/v1?Api-Key=eu01xx5221739599d6ceead24f49fcf2FFFFNRAL&format=cloudflare?Api-Key=eu01xx5221739599d6ceead24f49fcf2FFFFNRAL&format=cloudflare"
  enabled          = true
  name             = "NewRelic-Firewall-Request-dev.pimenta.fun"
  zone_id          = cloudflare_zone.zone.id
  output_options {
    field_names = ["Action",
      "ClientASN",
      "ClientASNDescription",
      "ClientCountry",
      "ClientIP",
      "ClientIPClass",
      "ClientRefererHost",
      "ClientRefererPath",
      "ClientRefererQuery",
      "ClientRefererScheme",
      "ClientRequestHost",
      "ClientRequestMethod",
      "ClientRequestPath",
      "ClientRequestProtocol",
      "ClientRequestQuery",
      "ClientRequestScheme",
      "ClientRequestUserAgent",
      "ContentScanObjResults",
      "ContentScanObjSizes",
      "ContentScanObjTypes",
      "Datetime",
      "Description",
      "EdgeColoCode",
      "EdgeResponseStatus",
      "Kind",
      "LeakedCredentialCheckResult",
      "MatchIndex",
      "Metadata",
      "OriginResponseStatus",
      "OriginatorRayID",
      "RayID",
      "Ref",
      "RuleID",
      "Source"
    ]
    sample_rate      = null
    timestamp_format = "rfc3339"
  }
}