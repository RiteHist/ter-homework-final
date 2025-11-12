# Общие переменные

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
    description = "Список имен ресурсов, которым нужна отдельная подсеть. Каждому имени должен соответствовать отдельный CIDR в subnet_cidr_list."
    default = ["web", "db"]
    validation {
        condition = length(var.subnet_cidr_list) == length(var.resource_names_list)
        error_message = "Количество имен ресурсов (${length(var.resource_names_list)}) не соответствует количеству блоков CIDR (${length(var.subnet_cidr_list)})."
    }
}

variable "resource_type_list" {
    type = list(string)
    description = "Список типов ресурсов."
    default = ["vm", "cluster", "registry"]
}

variable "default_zone" {
    type = string
    default = "ru-central1-a"
    description = "Зона доступности по умолчанию."
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

# Переменные для VM

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

variable "vm_git_branch" {
    type = string
    default = "main"
    description = "Ветка репозитория из которой берутся файлы приложения."
}

# Переменные для DB

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
    description = "Параметры кластера MySQL."
}

variable "db_params" {
    type = map(string)
    default = {
        name = "test"
        user = "me"
    }
    description = "Параметры базы данных."
}

variable "db_password" {
    sensitive = true
    type = string
    description = "Пароль для доступа в базу данных."
}

variable "db_user_priviliges" {
    type = list(string)
    default = ["ALL"]
    description = "Роли пользователя базы данных"
}

# Переменные для Registry

variable "regsitry_docker_image_name" {
    type = string
    default = "python-web"
    description = "Имя образа, которое присваиватся собранному Docker образу."
}

variable "registry_docker_image_tags" {
    type = list(string)
    default = ["1.0", "latest"]
    description = "Список тегов Docker образа."
}

variable "registry_address" {
    type = string
    default = "cr.yandex"
    description = "Адрес удаленного реестра."
}

variable "registry_roles" {
    type = list(string)
    default = ["container-registry.images.puller"]
    description = "Список ролей для registry."
}

variable "dockerfile_path" {
    type = string
    default = "./python-web/."
    description = "Путь к Dockerfile для сборки."
}