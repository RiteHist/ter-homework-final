vm_metadata = {
  "serial-port-enable" = "1"
}
vm_params = [{
    username = "ritehist"
    user_groups = ["sudo", "docker"]
    image_family = "ubuntu-2004-lts"
    cores = 2
    memory = 1
    core_fraction = 20
    preemptible = true
    platform_id = "standard-v4a"
    nat = true
    disk_volume = 10
    packages = [
        "docker-ce", "docker-ce-cli", "containerd.io", "docker-buildx-plugin","docker-compose-plugin"
    ]
}]
db_cluster_params = [{
    environment = "PRODUCTION"
    version = "8.0"
    deletion_protection = false
    description = "MySQL кластер"
    resource_preset_id = "b1.medium"
    disk_size = 10
    disk_type_id = "network-hdd"
}]