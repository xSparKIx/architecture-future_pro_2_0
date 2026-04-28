terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  token     = var.yc_token
  cloud_id  = var.yc_cloud_id
  folder_id = var.yc_folder_id
  zone      = var.zone
}

module "vm" {
  source = "../../modules/vm"

  # Параметры ВМ
  vm_name      = var.vm_name
  cpu_count    = var.cpu_count
  ram_size     = var.ram_size
  zone         = var.zone
  image_family = var.image_family

  # Параметры дисков
  boot_disk_size         = var.boot_disk_size
  create_additional_disk = var.create_additional_disk
  additional_disk_size   = var.additional_disk_size

  # Сеть
  subnet_id        = var.subnet_id
  assign_public_ip = var.assign_public_ip

  # SSH
  ssh_key_path = var.ssh_key_path

  # Метки
  labels = merge(var.labels, {
    environment = "stage"
    owner       = "devops"
  })
}
