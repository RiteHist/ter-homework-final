terraform {
    required_providers {
      docker = {
        source = "kreuzwerker/docker"
        version = "~>3.6.1"
      }
    }
    required_version = "~>1.9.1"
}

provider "docker" {
    host = var.docker_host

    registry_auth {
        address = var.registry_address
    }
}

resource "docker_image" "image" {
    name = "${var.registry_address}/${var.registry_id}/${var.docker_image_name}:${var.docker_image_tags[0]}"
    build {
        context = var.dockerfile_path
    }
    keep_locally = false
}

resource "docker_registry_image" "image-remote" {
    name = docker_image.image.name
}