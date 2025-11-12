resource "yandex_container_registry" "registry" {
    name = "${var.env_names[0]}-${var.resource_type_list[2]}"
}

resource "yandex_iam_service_account" "registry-puller" {
    name = "${yandex_container_registry.registry.name}-puller"
}

resource "yandex_container_registry_iam_binding" "binding" {
    registry_id = yandex_container_registry.registry.id
    role = var.registry_roles[0]
    members = [
        "serviceAccount:${yandex_iam_service_account.registry-puller.id}"
    ]
}

module "docker" {
    source = "./docker"
    docker_image_name = var.regsitry_docker_image_name
    docker_image_tags = var.registry_docker_image_tags
    registry_address = var.registry_address
    registry_id = yandex_container_registry.registry.id
    dockerfile_path = var.dockerfile_path
}