resource "docker_container" "bgg_backend" {
    count = var.backend_count

    name = "bgg-backend-${count.index}"
    image = "chukmunnlee/bgg-backend:v3"

    networks_advanced {
        name = docker_network.bgg_net.name
    }

    env = [
        "BGG_DB_USR=ROOT",
        "BGG_DB_PASSWORD=changeit",
        "BGG_DB_HOST=${docker_container.bgg_database.name}"
    ]

    ports {
        internal = 3000
        external = 3000 + count.index
    }
}