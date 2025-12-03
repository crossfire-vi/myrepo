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
      "sudo apt update -y",
      "sudo apt upgrade -y",
      "sudo apt install -y nginx",

      # Upload Nginx config safely
      "echo \"${data.template_file.nginx_config.rendered}\" | sudo tee /etc/nginx/nginx.conf",

      # Validate the config before restarting
      "sudo nginx -t",

      # Enable and restart Nginx service
      "sudo systemctl enable nginx",
      "sudo systemctl restart nginx"
    ]
  }
}


