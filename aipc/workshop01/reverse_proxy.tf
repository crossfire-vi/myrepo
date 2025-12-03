data "digitalocean_ssh_key" "mykey" {
  name = "fred"
}

resource "digitalocean_droplet" "reverse_proxy" {
  name   = "reverse-proxy"
  region = var.DO_REGION
  size   = var.DO_SIZE
  image  = var.DO_IMAGE

  ssh_keys = [data.digitalocean_ssh_key.mykey.id]

  connection {
    type        = "ssh"
    host        = self.ipv4_address
    user        = "root"
    private_key = file("~/.ssh/id_ed25519")
  }

  # Install Nginx + upload rendered config + validate + restart
provisioner "remote-exec" {
  inline = [
    "apt update -y",
    "apt install -y apt-transport-https ca-certificates curl software-properties-common",
    "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -",
    "add-apt-repository 'deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable'",
    "apt update -y",
    "apt install -y docker-ce",
    "systemctl enable docker",
    "systemctl start docker",
  ]
}
}


