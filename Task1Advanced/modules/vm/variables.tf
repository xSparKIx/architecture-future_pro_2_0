# Основные параметры ВМ
variable "vm_name" {
  description = "Имя виртуальной машины"
  type        = string
  default     = "vm_module"
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

# Параметры образа через data source
variable "image_family" {
  description = "Семейство образа ОС"
  type        = string
  default     = "ubuntu-2204-lts"
}

# Параметры загрузочного диска
variable "boot_disk_size" {
  description = "Размер загрузочного диска в ГБ"
  type        = number
  default     = 20
}

variable "boot_disk_type" {
  description = "Тип загрузочного диска"
  type        = string
  default     = "network-hdd"
}

# Параметры дополнительного диска
variable "create_additional_disk" {
  description = "Создавать ли дополнительный диск"
  type        = bool
  default     = false
}

variable "attach_disk_id" {
  description = "ID подключаемого диска (если не создавать новый)"
  type        = string
  default     = null
}

variable "additional_disk_size" {
  description = "Размер дополнительного диска в ГБ"
  type        = number
  default     = 10
}

variable "additional_disk_type" {
  description = "Тип дополнительного диска"
  type        = string
  default     = "network-hdd"
}

# Сетевые параметры
variable "subnet_id" {
  description = "ID подсети"
  type        = string
}

variable "assign_public_ip" {
  description = "Назначать ли публичный IP адрес"
  type        = bool
  default     = false
}

variable "ssh_username" {
  description = "Имя пользователя"
  type        = string
  default     = "ubuntu"
}

variable "platform_id" {
  description = "Идентификатор платформы"
  type        = string
  default     = "standard-v3"
}

variable "ssh_key_path" {
  description = "Путь к файлу с SSH ключом"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

# Теги и метки
variable "labels" {
  description = "Дополнительные метки ресурсов"
  type        = map(string)
  default     = {}
}
