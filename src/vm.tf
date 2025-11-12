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
        security_group_ids = [yandex_vpc_security_group.web-sg.id]
    }
    scheduling_policy {
        preemptible = var.vm_params[0].preemptible
    }
    metadata = local.vm_metadata_combined
    service_account_id = yandex_iam_service_account.registry-puller.id
    depends_on = [yandex_mdb_mysql_user.db_user]
}

data "template_file" "cloud-init" {
    template = file("./cloud-init.yml")

    vars = {
        vm_username = var.vm_params[0].username
        ssh_pub_key = jsonencode(local.ssh_pub_key)
        user_groups = jsonencode(var.vm_params[0].user_groups)
        packages = jsonencode(var.vm_params[0].packages)
        docker_gpg_keyid = var.vm_docker_gpg_keyid
        docker_image = module.docker.docker_image_name
        mysql_host = yandex_mdb_mysql_cluster.mysql-cluster.host[0].fqdn
        mysql_user = var.db_params.user
        mysql_password = var.db_password
        mysql_database = var.db_params.name
    }
}