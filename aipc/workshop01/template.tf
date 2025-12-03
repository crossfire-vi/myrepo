data "template_file" "nginx_config" {
  template = file("${path.module}/nginx.conf.tpl")

  vars = {
    endpoints = join("\n", [
      for c in docker_container.bgg_backend :
      "   server ${c.network_data[0].ip_address}:3000;"
      #"        server ${c.networks_advanced[0].ip_address}:3000;"
    ])
  }
}
