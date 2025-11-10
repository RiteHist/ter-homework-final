resource "yandex_mdb_mysql_cluster" "mysql-cluster" {
    name = "${var.env_names[0]}-cluster"
    description = var.db_cluster_params[0].description
    environment = var.db_cluster_params[0].environment
    network_id = module.vpc.network_info.id
    version = var.db_cluster_params[0].version

    resources {
        resource_preset_id = var.db_cluster_params[0].resource_preset_id
        disk_size = var.db_cluster_params[0].disk_size
        disk_type_id = var.db_cluster_params[0].disk_type_id
    }

    host {
        zone = var.default_zone
        subnet_id = module.vpc.subnet_info[var.resource_names_list[1]].id
        name = var.resource_names_list[1]
    }
}

resource "yandex_mdb_mysql_database" "db" {
    cluster_id = yandex_mdb_mysql_cluster.mysql-cluster.id
    name = var.db_params.name
}

resource "yandex_mdb_mysql_user" "db_user" {
    cluster_id = yandex_mdb_mysql_cluster.mysql-cluster.id
    name = var.db_params.user
    password = var.db_password

    permission {
        database_name = yandex_mdb_mysql_database.db.name
        roles = var.db_user_priviliges
    }
}