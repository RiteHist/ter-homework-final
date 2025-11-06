module "vpc" {
    source = "./vpc"

    env = var.env_names[0]
    zone = var.default_zone
    subnet_map = local.subnet_map
}