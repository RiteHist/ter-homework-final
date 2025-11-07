data "yandex_compute_image" "vm_image" {
    family = var.vm_params[0].image_family
}

resource "yandex_compute_instance" "web_vm" {
    name = var.resource_names_list[0]
    hostname = var.resource_names_list[0]
    platform_id = var.vm_params[0].platform_id
    resources {
        cores = var.vm_params[0].cores
        memory = var.vm_params[0].memory
        core_fraction = var.vm_params[0].core_fraction
    }
    boot_disk {
        initialize_params {
            image_id = data.yandex_compute_image.vm_image.image_id
            size = var.vm_params[0].disk_volume
        }
    }
    network_interface {
        nat = var.vm_params[0].nat
        subnet_id = module.vpc.subnet_info[var.resource_names_list[0]].id
    }
    scheduling_policy {
        preemptible = var.vm_params[0].preemptible
    }
    metadata = local.vm_metadata_combined

}

data "template_file" "cloud-init" {
    template = file("./cloud-init.yml")

    vars = {
        vm_username = var.vm_params[0].username
        ssh_pub_key = jsonencode(local.ssh_pub_key)
        user_groups = jsonencode(var.vm_params[0].user_groups)
        packages = jsonencode(var.vm_params[0].packages)
        docker_gpg_keyid = var.vm_docker_gpg_keyid
    }
}