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
