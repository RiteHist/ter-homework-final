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