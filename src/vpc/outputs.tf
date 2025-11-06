output "subnet_info" {
  value = {
    for name, subnet in yandex_vpc_subnet.vpc-subnet : name => {
        name = subnet.name
        cidr = subnet.v4_cidr_blocks
        zone = subnet.zone
        id = subnet.id
    }
  }
}
output "network_info" {
    value = {
        name = yandex_vpc_network.vpc-network.name
        id = yandex_vpc_network.vpc-network.id
    }
}