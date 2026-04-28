terraform {
  required_version = ">= 1.6.0"

  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = ">= 0.98.0"
    }
  }

  backend "s3" {}
}

provider "yandex" {
  token     = var.token != "" ? var.token : getenv("YC_TOKEN")
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zone
}

locals {
  subnet_zone = var.subnet_zone != "" ? var.subnet_zone : var.zone
}

resource "yandex_vpc_network" "main" {
  name   = var.network_name
  labels = var.labels
}

resource "yandex_vpc_subnet" "main" {
  name           = "${var.network_name}-subnet"
  zone           = local.subnet_zone
  network_id     = yandex_vpc_network.main.id
  v4_cidr_blocks = [var.subnet_cidr]
  labels         = var.labels
}