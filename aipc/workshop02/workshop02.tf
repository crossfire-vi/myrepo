data "digitalocean_ssh_key" "mykey" {
  name = "fred"
}

resource "digitalocean_droplet" "workshop02" {
  name   = "workshop02"
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
}

# Use a template file to generate inventory.yaml for Ansible
resource "local_file" "ansible_inventory" {
  filename = "${path.module}/inventory.yaml"

  content = templatefile("${path.module}/inventory.tmpl", {
    ansible_user        = var.ansible_user
    ansible_host        = digitalocean_droplet.workshop02.ipv4_address
    code_server_pass = var.code_server_pass
    code_server_port =  8080
    ssh_private_key_path = var.ssh_private_key_path
  })
}

output "ansible_inventory_path" {
  value = local_file.ansible_inventory.filename
}

output "server_ip" {
  value = digitalocean_droplet.workshop02.ipv4_address
}



