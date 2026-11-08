resource "yandex_compute_instance" "web" {
  count = var.web_count

  # ВМ из for_each-vm.tf должны быть созданы раньше
  depends_on = [yandex_compute_instance.db]

  # count.index начинается с 0, а имена нужны web-1, web-2
  name                      = "${var.web_name_prefix}-${count.index + 1}"
  hostname                  = "${var.web_name_prefix}-${count.index + 1}"
  platform_id               = var.vm_platform_id
  allow_stopping_for_update = true

  resources {
    cores         = var.web_resources.cores
    memory        = var.web_resources.memory
    core_fraction = var.web_resources.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      type     = var.vm_disk_type
      size     = var.web_resources.disk_volume
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
