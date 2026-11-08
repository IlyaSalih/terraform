###storage vars

variable "storage_disk_count" {
  type        = number
  default     = 3
  description = "Количество дополнительных дисков"
}

variable "storage_disk" {
  type = object({
    name_prefix = string
    size        = number
    type        = string
  })
  default = {
    name_prefix = "disk"
    size        = 1
    type        = "network-hdd"
  }
  description = "Параметры дополнительных дисков"
}

variable "storage_vm" {
  type = object({
    name          = string
    cores         = number
    memory        = number
    core_fraction = number
    disk_volume   = number
  })
  default = {
    name          = "storage"
    cores         = 2
    memory        = 1
    core_fraction = 5
    disk_volume   = 3
  }
  description = "Параметры ВМ storage"
}


###disks

resource "yandex_compute_disk" "storage" {
  count = var.storage_disk_count

  name = "${var.storage_disk.name_prefix}-${count.index + 1}"
  zone = var.default_zone # диск должен быть в той же зоне, что и ВМ
  size = var.storage_disk.size
  type = var.storage_disk.type
}


###storage vm (одиночная — без count/for_each)

resource "yandex_compute_instance" "storage" {
  name                      = var.storage_vm.name
  hostname                  = var.storage_vm.name
  platform_id               = var.vm_platform_id
  allow_stopping_for_update = true

  resources {
    cores         = var.storage_vm.cores
    memory        = var.storage_vm.memory
    core_fraction = var.storage_vm.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      type     = var.vm_disk_type
      size     = var.storage_vm.disk_volume
    }
  }

  # по одному блоку secondary_disk на каждый созданный диск
  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.storage
    content {
      disk_id = secondary_disk.value.id
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
