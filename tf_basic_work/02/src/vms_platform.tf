###vm_web vars

variable "vm_web_image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Семейство образа ОС"
}


variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v2"
  description = "Платформа ВМ"
}

variable "vm_web_cores" {
  type        = number
  default     = 2
  description = "Количество vCPU"
}

variable "vm_web_memory" {
  type        = number
  default     = 2
  description = "Объём RAM, ГБ"
}

variable "vm_web_core_fraction" {
  type        = number
  default     = 20
  description = "Гарантированная доля vCPU, %"
}

variable "vm_web_preemptible" {
  type        = bool
  default     = true
  description = "Прерываемая ВМ"
}

variable "vm_web_nat" {
  type        = bool
  default     = true
  description = "Публичный IP через NAT"
}

variable "vm_web_serial_port_enable" {
  type        = number
  default     = 1
  description = "Доступ к серийной консоли"
}


###vm_db vars

variable "vm_db_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "Зона доступности ВМ db (по заданию ru-central1-b — недоступна)"
}

variable "vm_db_cidr" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "CIDR подсети ВМ db"
}

variable "vm_db_image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Семейство образа ОС"
}


variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v2"
  description = "Платформа ВМ"
}

variable "vm_db_cores" {
  type        = number
  default     = 2
  description = "Количество vCPU"
}

variable "vm_db_memory" {
  type        = number
  default     = 2
  description = "Объём RAM, ГБ"
}

variable "vm_db_core_fraction" {
  type        = number
  default     = 20
  description = "Гарантированная доля vCPU, %"
}

variable "vm_db_preemptible" {
  type        = bool
  default     = true
  description = "Прерываемая ВМ"
}

variable "vm_db_nat" {
  type        = bool
  default     = true
  description = "Публичный IP через NAT"
}

variable "vm_db_serial_port_enable" {
  type        = number
  default     = 1
  description = "Доступ к серийной консоли"
}


###vm name parts

variable "vm_project" {
  type        = string
  default     = "netology"
  description = "Проект — первая часть имени ВМ"
}

variable "vm_platform" {
  type        = string
  default     = "platform"
  description = "Платформа — часть имени ВМ"
}

variable "vm_web_role" {
  type        = string
  default     = "web"
  description = "Роль ВМ web — последняя часть имени"
}

variable "vm_db_role" {
  type        = string
  default     = "db"
  description = "Роль ВМ db — последняя часть имени"
}
