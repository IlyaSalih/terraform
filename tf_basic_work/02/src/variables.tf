###cloud vars


variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-d"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}


###ssh vars

variable "vms_ssh_public_root_key" {
  type        = string
  description = "Публичная часть ssh-ключа (ssh-keygen -t ed25519). Задаётся в personal.auto.tfvars"
}


###vm_web vars

variable "vm_web_image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Семейство образа ОС"
}

variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "Имя ВМ"
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
