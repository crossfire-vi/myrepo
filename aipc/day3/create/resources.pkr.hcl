variable DO_TOKEN {
    type = string
    sensitive = true
    description = "Digital Ocean API Token"
}

variable DO_REGION {
    type = string
    default = "sgp1"
}

variable DO_SIZE {
    type = string
    default = "s-2vcpu-4gb"
}

variable DO_IMAGE {
    type = string
    default = "ubuntu-24-04-x64"
}

source "digitalocean" "mydroplet_day3" {
    api_token = var.DO_TOKEN
    image = var.DO_IMAGE
    size = var.DO_SIZE #this size or larger can be created
    region = var.DO_REGION
    snapshot_name = "aipc-day3-nginx-{{timestamp}}"
    ssh_username = "root"
}

build {
    sources = [
        "source.digitalocean.mydroplet_day3"
    ]
    provisioner ansible {
        playbook_file = "playbook.yaml"
    }
}