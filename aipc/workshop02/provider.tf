terraform {
  required_providers {
    local = {
        source = "hashicorp/local"
        version = "2.6.1"
    }
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.41.0"
    }
  }
}

provider "local" {
  # Configuration options
}

provider "digitalocean" {
  # Configuration options
  token = var.DO_TOKEN
}