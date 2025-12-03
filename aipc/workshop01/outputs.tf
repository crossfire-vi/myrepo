#output "reverse_proxy_ip" {
#    value = digitalocean_droplet.reverse_proxy.ipv4_address
#}

output "container_endpoints" {
    value = [
        for idx in range(var.backend_count) : 
        "localhost:${3000 + idx}"
    ]
}

#output "root_file" {
#    value = "root@${digitalocean_droplet.reverse_proxy.ipv4_address}"
#}