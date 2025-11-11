resource "yandex_container_registry" "registry" {
    name = "${var.env_names[0]}-registry"
}

# resource "yandex_container_registry_ip_permission" "permissions" {
#     registry_id = yandex_container_registry.registry.id
#     pull = [var.subnet_cidr_list[0]]
#     depends_on = [module.vpc]
# }

module "docker" {
    source = "./docker"
    docker_image_name = var.regsitry_docker_image_name
    docker_image_tags = var.registry_docker_image_tags
    registry_address = var.registry_address
    registry_id = yandex_container_registry.registry.id
    dockerfile_path = var.dockerfile_path
}