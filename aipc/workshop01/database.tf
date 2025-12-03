resource "docker_volume" "bgg_data" {
    name = "bgg-data"
}

resource "docker_container" "bgg_database" {
    name = "bgg-database"
    image = "chukmunnlee/bgg-database:v3.1"

networks_advanced {
    name = docker_network.bgg_net.name
}

volumes {
    container_path = "/var/lib/mysql"
    volume_name = "docker_volume.bgg_data.name"
}
ports {
    internal = 3306
    external = 3307
}
}