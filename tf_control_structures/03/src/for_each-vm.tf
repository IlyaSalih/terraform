data "yandex_compute_image" "ubuntu" {
  family = var.vm_image_family
}

resource "yandex_compute_instance" "db" {
  # for_each не принимает list — превращаем список в map с ключом vm_name
  for_each = { for vm in var.each_vm : vm.vm_name => vm }

  name                      = each.value.vm_name
  hostname                  = each.value.vm_name
  platform_id               = var.vm_platform_id
  allow_stopping_for_update = true

  resources {
    cores         = each.value.cpu
    memory        = each.value.ram
    core_fraction = each.value.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      type     = var.vm_disk_type
      size     = each.value.disk_volume
    }
  }

  scheduling_policy {
    preemptible = var.vm_preemptible
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.develop.id
    nat                = var.vm_nat
    security_group_ids = [yandex_vpc_security_group.example.id]
  }

  metadata = local.metadata
}
