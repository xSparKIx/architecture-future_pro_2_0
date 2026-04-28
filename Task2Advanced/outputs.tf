output "network_id" {
  value       = yandex_vpc_network.main.id
  description = "Created VPC network ID."
}

output "subnet_id" {
  value       = yandex_vpc_subnet.main.id
  description = "Created subnet ID."
}