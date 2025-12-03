data "digitalocean_ssh_key" "mykey" {
  name = "fred"
}

# Create a new Web Droplet in the nyc2 region
resource "digitalocean_droplet" "mydroplet" {
  name    = "mydroplet"
  image   = var.DO_IMAGE
  region  = var.DO_REGION
  size    = var.DO_SIZE
  ssh_keys = [data.digitalocean_ssh_key.mykey.id]
}

output "droplet_ipv4_address" {
  value = digitalocean_droplet.mydroplet.ipv4_address
}