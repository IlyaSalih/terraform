output "vm_external_ip" {
  description = "Внешний IP ВМ — сверить с выводом curl ifconfig.me"
  value       = yandex_compute_instance.platform.network_interface[0].nat_ip_address
}
