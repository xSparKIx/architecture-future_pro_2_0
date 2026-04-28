output "instance_name" {
  description = "Имя виртуальной машины"
  value       = yandex_compute_instance.vm.name
}

output "external_ip" {
  description = "Публичный IP адрес ВМ"
  value       = var.assign_public_ip ? yandex_compute_instance.vm.network_interface[0].nat_ip_address : null
}

output "boot_disk_id" {
  description = "ID загрузочного диска"
  value       = yandex_compute_disk.boot_disk.id
}

output "boot_disk_name" {
  description = "Имя загрузочного диска"
  value       = yandex_compute_disk.boot_disk.name
}

output "additional_disk_id" {
  description = "ID дополнительного диска"
  value       = var.create_additional_disk ? yandex_compute_disk.additional_disk[0].id : (var.attach_disk_id != null ? var.attach_disk_id : null)
}

output "additional_disk_name" {
  description = "Имя дополнительного диска"
  value       = var.create_additional_disk ? yandex_compute_disk.additional_disk[0].name : null
}
output "instance_id" {
  value       = yandex_compute_instance.vm.id
  description = "ID созданной виртуальной машины"
}

output "internal_ip" {
  description = "Внутренний IP-адрес"
  value       = yandex_compute_instance.vm.network_interface[0].ip_address
}
