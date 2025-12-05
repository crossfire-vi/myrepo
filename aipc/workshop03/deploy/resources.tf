data "digitalocean_ssh_key" "mykey" {
  name = "fred"
}

data "digitalocean_image" "nginx_image" {
    name   = "aipc-day3-code-server-1764922344"
}

resource "digitalocean_droplet" "day3_codeserver_nginx" {
  name = "day3-codeserver-nginx"
  image = data.digitalocean_image.nginx_image.id
  region = "sgp1"
  size = var.DO_SIZE
  tags = ["aipc", "day3", "nginx"]
  ssh_keys = [data.digitalocean_ssh_key.mykey.id]


     connection {
     type = "ssh"
     user = "root"
     private_key = file("~/.ssh/id_ed25519")
     host = self.ipv4_address
   }

   provisioner "remote-exec" {
      inline = [  
         "sudo sed -i 's/server_name[[:space:]]*_;/server_name ${self.ipv4_address};/' /etc/nginx/sites-available/code-server.conf",
         "systemctl daemon-reload",
         "systemctl restart nginx"
      ]
   }
}

output "mynginx_ip" {
  value = digitalocean_droplet.day3_codeserver_nginx.ipv4_address    
}
