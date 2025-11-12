variable "env" {
    type = string
    description = "Имя окружения для VPC"
}

variable "zone" {
    type = string
    description = "Зона доступности"
}

variable "subnet_map" {
    type = map(string)
    description = "Имя подсети и соответствующий блок CIDR"
}