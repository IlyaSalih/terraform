###common vm vars

variable "vm_image_family" {
  type        = string
  default     = "debian-11"
  description = "Семейство образа ОС"
}

variable "vm_platform_id" {
  type        = string
  default     = "standard-v2"
  description = "Платформа ВМ"
}

variable "vm_preemptible" {
  type        = bool
  default     = true
  description = "Прерываемые ВМ"
}

variable "vm_nat" {
  type        = bool
  default     = true
  description = "Публичный IP через NAT"
}

variable "vm_disk_type" {
  type        = string
  default     = "network-hdd"
  description = "Тип загрузочного диска"
}

variable "ssh_public_key_path" {
  type        = string
  default     = "~/.ssh/id_ed25519.pub"
  description = "Путь к публичному ssh-ключу"
}


###web (count) vars

variable "web_count" {
  type        = number
  default     = 2
  description = "Количество web-ВМ"
}

variable "web_name_prefix" {
  type        = string
  default     = "web"
  description = "Префикс имени web-ВМ: web-1, web-2..."
}

variable "web_resources" {
  type = object({
    cores         = number
    memory        = number
    core_fraction = number
    disk_volume   = number
  })
  default = {
    cores         = 2
    memory        = 1
    core_fraction = 5
    disk_volume   = 3
  }
  description = "Минимальные ресурсы web-ВМ"
}


###db (for_each) vars

variable "each_vm" {
  type = list(object({
    vm_name       = string
    cpu           = number
    ram           = number
    disk_volume   = number
    core_fraction = number
  }))
  default = [
    {
      vm_name       = "main"
      cpu           = 4
      ram           = 4
      disk_volume   = 4
      core_fraction = 5
    },
    {
      vm_name       = "replica"
      cpu           = 2
      ram           = 2
      disk_volume   = 3
      core_fraction = 5
    },
  ]
  description = "Параметры ВМ баз данных"
}
