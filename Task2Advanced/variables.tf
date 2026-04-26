variable "token" {
  description = "Авторизационный токен"
  type        = string
  default     = ""
  sensitive   = true
}

variable "cloud_id" {
  description = "Уникальный идентификатор облака"
  type        = string
}

variable "folder_id" {
  description = "Уникальный идентификатор папки"
  type        = string
}

variable "zone" {
  description = "Зона для провайдера"
  type        = string
  default     = "ru-central1-a"
}

variable "subnet_zone" {
  description = "Зона для подсети"
  type        = string
  default     = ""
}

variable "network_name" {
  description = "Наименование сети"
  type        = string
  default     = "task2-net"
}

variable "subnet_cidr" {
  description = "CIDR для подсети"
  type        = string
  default     = "10.20.0.0/24"
}

variable "labels" {
  description = "Дополнительные метки ресурсов"
  type        = map(string)
  default     = {}
}
