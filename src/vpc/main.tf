terraform {
    required_providers {
      yandex = {
        source = "yandex-cloud/yandex"
      }
    }
    required_version = "~>1.9.1"
}

resource "yandex_vpc_network" "vpc-network" {
    name = var.env
}

resource "yandex_vpc_subnet" "vpc-subnet" {
    for_each = var.subnet_map

    name = "${each.key}-subnet"
    zone = var.zone
    network_id = yandex_vpc_network.vpc-network.id
    v4_cidr_blocks = [each.value]
}