locals {
  ssh_public_key = chomp(file(var.ssh_public_key_path))

  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${local.ssh_public_key}"
  }
}
