terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "4.48.0"
    }
  }

  //  backend "s3" {
  //    bucket                      = "terraform-state"
  //    key                         = "r2-terraform-ikea-state-files/ikea-test.tpimenta.xyz/terraform.tfstate"
  //    region                      = "auto"
  //    skip_credentials_validation = true
  //    skip_metadata_api_check     = true
  //    skip_region_validation      = true
  //    skip_requesting_account_id  = true
  //    skip_s3_checksum            = true
  //    use_path_style              = true
  //    endpoints                   = { s3 = "https://c25bc3d9f1803636f9b4362d590ad41c.r2.cloudflarestorage.com" }
  //  }
}
