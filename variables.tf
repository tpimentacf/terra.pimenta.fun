variable "cloudflare_account_tag" {
  type    = string
  default = "9af757cde4de6c1ab25168f42af2b950" //"<Account_TAG>"
}

variable "cloudflare_zone_name" {
  type    = string
  default = "terra.pimenta.fun"
}

variable "cloudflare_zone_plan" {
  type    = string
  default = "enterprise"
}

variable "cloudflare_zone_type" {
  type    = string
  default = "partial" //partial
}

variable "r2_bucket_name" {
  type    = string
  default = "r2bucket"
}