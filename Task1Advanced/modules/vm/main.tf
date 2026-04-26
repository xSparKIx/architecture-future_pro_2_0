terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

data "yandex_compute_image" "os_image" {
  family = var.image_family
}

resource "yandex_compute_disk" "boot_disk" {
  name     = "${var.vm_name}-boot-disk"
  type     = var.boot_disk_type
  zone     = var.zone
  image_id = data.yandex_compute_image.os_image.id
  size     = var.boot_disk_size
  labels   = var.labels
}

resource "yandex_compute_disk" "additional_disk" {
  count = var.create_additional_disk ? 1 : 0

  name   = "${var.vm_name}-additional-disk"
  type   = var.additional_disk_type
  zone   = var.zone
  size   = var.additional_disk_size
  labels = merge(var.labels, { purpose = "additional-storage" })
}

resource "yandex_compute_instance" "vm" {
  name        = var.vm_name
  platform_id = var.platform_id
  zone        = var.zone

  resources {
    cores  = var.cpu_count
    memory = var.ram_size
  }

  boot_disk {
    disk_id = yandex_compute_disk.boot_disk.id
  }

  dynamic "secondary_disk" {
    for_each = var.attach_disk_id != null ? [1] : []
    content {
      disk_id     = var.attach_disk_id
      auto_delete = false
    }
  }

  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.additional_disk
    content {
      disk_id     = secondary_disk.value.id
      auto_delete = false
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = var.assign_public_ip
  }

  metadata = {
    ssh-keys = "${var.ssh_username}:${file(var.ssh_key_path)}"
  }

  labels = var.labels
}
