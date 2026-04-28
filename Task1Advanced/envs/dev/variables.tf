variable "yc_token" {
  description = "Yandex Cloud OAuth token"
  type        = string
  sensitive   = true
}

variable "yc_cloud_id" {
  description = "Yandex Cloud ID"
  type        = string
  sensitive   = true
}

variable "yc_folder_id" {
  description = "Yandex Cloud Folder ID"
  type        = string
  sensitive   = true
}

variable "image_family" {
  description = "Семейство образов ОС (например, ubuntu-2204-lts)"
  type        = string
}

variable "vm_name" {
  description = "Имя виртуальной машины"
  type        = string
  default     = "dev-vm"
}

variable "cpu_count" {
  description = "Количество ядер CPU"
  type        = number
  default     = 2
}

variable "ram_size" {
  description = "Объем оперативной памяти в ГБ"
  type        = number
  default     = 2
}

variable "zone" {
  description = "Зона доступности"
  type        = string
  default     = "ru-central1-a"
}

variable "boot_disk_size" {
  description = "Размер загрузочного диска в ГБ"
  type        = number
  default     = 20
}

variable "create_additional_disk" {
  description = "Создавать ли дополнительный диск"
  type        = bool
  default     = false
}

variable "additional_disk_size" {
  description = "Размер дополнительного диска в ГБ"
  type        = number
  default     = 10
}

variable "subnet_id" {
  description = "ID подсети"
  type        = string
}

variable "assign_public_ip" {
  description = "Назначать ли публичный IP адрес"
  type        = bool
  default     = true
}

variable "ssh_key_path" {
  description = "Путь к файлу с SSH ключом"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "labels" {
  description = "Дополнительные метки ресурсов"
  type        = map(string)
  default     = {}
}