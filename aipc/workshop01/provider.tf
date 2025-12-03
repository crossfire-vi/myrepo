terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "3.6.2"
    }
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

provider "docker" {
  # Configuration options
}

provider "local" {
  # Configuration options
}

provider "digitalocean" {
  # Configuration options
  token = var.DO_TOKEN
}