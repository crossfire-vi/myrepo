terraform {
  required_version = ">= 1.4.0"

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }

}

provider "digitalocean" {
  # Configuration options
  token = var.DO_TOKEN
}

