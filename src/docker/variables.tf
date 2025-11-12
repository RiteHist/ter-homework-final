variable "registry_address" {
    type = string
    description = "Адрес удаленного реестра."
}

variable "registry_id" {
    type = string
    description = "ID реестра."
}

variable "docker_image_name" {
    type = string
    description = "Имя образа Docker."
}

variable "docker_image_tags" {
    type = list(string)
    description = "Список тегов для образа Docker."
}

variable "docker_host" {
    type = string
    default = "tcp://localhost:2375"
    description = "Адрес Docker демона."
}

variable "dockerfile_path" {
    type = string
    description = "Путь до Dockerfile."
}

variable "keep_image_locally" {
    type = bool
    description = "Поведение относительно образа при terraform delete."
    default = false
}