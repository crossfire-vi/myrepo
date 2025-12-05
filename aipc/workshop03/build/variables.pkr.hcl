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

variable "ansible_user" {
  type        = string
  default     = "root"
  description = "User Ansible will use to connect"
}
variable "code_server_pass" {
  type        = string
  default     = "changeit"
  description = "Code Server default password"
}

variable "ssh_private_key_path" {
  type        = string
  default     = "~/.ssh/id_ed25519"
  description = "Path to private key for Ansible SSH"
}