variable "subnet_cidr_list" {
    type = list(string)
    description = "Список CIDR для подсетей."
    default = ["10.0.1.0/24", "10.0.2.0/24"]
    validation {
        condition = alltrue([for cidr in var.subnet_cidr_list: can(cidrhost("${cidr}", 0))])
        error_message = "В списке присутствуют CIDR неверного формата."
    }
}

variable "resource_names_list" {
    type = list(string)
    description = "Список имен ресурсов. Каждому имени должен соответствовать отдельный CIDR в subnet_cidr_list."
    default = ["web", "db"]
    validation {
        condition = length(var.subnet_cidr_list) == length(var.resource_names_list)
        error_message = "Количество имен ресурсов (${length(var.resource_names_list)}) не соответствует количеству блоков CIDR (${length(var.subnet_cidr_list)})."
    }
}

variable "default_zone" {
    type = string
    default = "ru-central1-a"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "env_names" {
    type = list(string)
    description = "Список окружений."
    default = ["develop"]
}

variable "vm_params" {
    type = list(object({
        username = string
        user_groups = list(string)
        image_family = string
        cores = number
        memory = number
        core_fraction = number
        preemptible = bool
        platform_id = string
        nat = bool
        disk_volume = number
        packages = list(string)
    }))
    description = "Параметры виртуальной машины."
}

variable "vm_ssh_key_path" {
    type = string
    default = "~/.ssh/id_ed25519.pub"
    description = "Путь до публичного ssh ключа для подключения к ВМ."
}

variable "vm_metadata" {
    type = map(string)
    description = "Метаданные ВМ."
}

variable "vm_docker_gpg_keyid" {
    type = string
    default = "9DC858229FC7DD38854AE2D88D81803C0EBFCD88"
    description = "Отпечаток GPG ключа APT репозитория Docker"
}

variable "db_cluster_params" {
    type = list(object(
        {
            environment = string
            version = string
            deletion_protection = bool
            description = string
            resource_preset_id = string
            disk_size = number
            disk_type_id = string
        }
    ))
}

variable "db_params" {
    type = map(string)
    default = {
        name = "test"
        user = "me"
    }
}

variable "db_password" {
    sensitive = true
    type = string
}

variable "db_user_priviliges" {
    type = list(string)
    default = ["ALL"]
}