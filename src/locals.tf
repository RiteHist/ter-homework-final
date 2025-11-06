locals {
    subnet_map = { for i, name in var.resource_names_list : name => var.subnet_cidr_list[i] }
}