data "digitalocean_ssh_key" "mykey" {
  name = "fred"
}

data "digitalocean_image" "nginx_image" {
    name   = "aipc-day3-nginx-1764902423"
}

resource "digitalocean_droplet" "day3_mynginx" {
  name = "day3-mynginx"
  image = data.digitalocean_image.nginx_image.id
  region = "sgp1"
  size = var.DO_SIZE
  tags = ["aipc", "day3", "nginx"]
  ssh_keys = [data.digitalocean_ssh_key.mykey.id]
}

output "mynginx_ip" {
  value = digitalocean_droplet.day3_mynginx.ipv4_address    
}
