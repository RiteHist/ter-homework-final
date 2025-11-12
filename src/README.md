<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~>1.9.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_template"></a> [template](#provider\_template) | 2.2.0 |
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | 0.169.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_docker"></a> [docker](#module\_docker) | ./docker | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ./vpc | n/a |

## Resources

| Name | Type |
|------|------|
| [yandex_compute_instance.web_vm](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/compute_instance) | resource |
| [yandex_container_registry.registry](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/container_registry) | resource |
| [yandex_container_registry_iam_binding.binding](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/container_registry_iam_binding) | resource |
| [yandex_iam_service_account.registry-puller](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/iam_service_account) | resource |
| [yandex_mdb_mysql_cluster.mysql-cluster](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/mdb_mysql_cluster) | resource |
| [yandex_mdb_mysql_database.db](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/mdb_mysql_database) | resource |
| [yandex_mdb_mysql_user.db_user](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/mdb_mysql_user) | resource |
| [yandex_vpc_security_group.web-sg](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_security_group) | resource |
| [template_file.cloud-init](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |
| [yandex_compute_image.vm_image](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/data-sources/compute_image) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloud_id"></a> [cloud\_id](#input\_cloud\_id) | https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id | `string` | n/a | yes |
| <a name="input_db_cluster_params"></a> [db\_cluster\_params](#input\_db\_cluster\_params) | Параметры кластера MySQL. | <pre>list(object(<br/>        {<br/>            environment = string<br/>            version = string<br/>            deletion_protection = bool<br/>            description = string<br/>            resource_preset_id = string<br/>            disk_size = number<br/>            disk_type_id = string<br/>        }<br/>    ))</pre> | n/a | yes |
| <a name="input_db_params"></a> [db\_params](#input\_db\_params) | Параметры базы данных. | `map(string)` | <pre>{<br/>  "name": "test",<br/>  "user": "me"<br/>}</pre> | no |
| <a name="input_db_password"></a> [db\_password](#input\_db\_password) | Пароль для доступа в базу данных. | `string` | n/a | yes |
| <a name="input_db_user_priviliges"></a> [db\_user\_priviliges](#input\_db\_user\_priviliges) | Роли пользователя базы данных | `list(string)` | <pre>[<br/>  "ALL"<br/>]</pre> | no |
| <a name="input_default_zone"></a> [default\_zone](#input\_default\_zone) | Зона доступности по умолчанию. | `string` | `"ru-central1-a"` | no |
| <a name="input_dockerfile_path"></a> [dockerfile\_path](#input\_dockerfile\_path) | Путь к Dockerfile для сборки. | `string` | `"./python-web/."` | no |
| <a name="input_env_names"></a> [env\_names](#input\_env\_names) | Список окружений. | `list(string)` | <pre>[<br/>  "develop"<br/>]</pre> | no |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id | `string` | n/a | yes |
| <a name="input_registry_address"></a> [registry\_address](#input\_registry\_address) | Адрес удаленного реестра. | `string` | `"cr.yandex"` | no |
| <a name="input_registry_docker_image_tags"></a> [registry\_docker\_image\_tags](#input\_registry\_docker\_image\_tags) | Список тегов Docker образа. | `list(string)` | <pre>[<br/>  "1.0",<br/>  "latest"<br/>]</pre> | no |
| <a name="input_registry_roles"></a> [registry\_roles](#input\_registry\_roles) | Список ролей для registry. | `list(string)` | <pre>[<br/>  "container-registry.images.puller"<br/>]</pre> | no |
| <a name="input_regsitry_docker_image_name"></a> [regsitry\_docker\_image\_name](#input\_regsitry\_docker\_image\_name) | Имя образа, которое присваиватся собранному Docker образу. | `string` | `"python-web"` | no |
| <a name="input_resource_names_list"></a> [resource\_names\_list](#input\_resource\_names\_list) | Список имен ресурсов, которым нужна отдельаня подсеть. Каждому имени должен соответствовать отдельный CIDR в subnet\_cidr\_list. | `list(string)` | <pre>[<br/>  "web",<br/>  "db"<br/>]</pre> | no |
| <a name="input_resource_type_list"></a> [resource\_type\_list](#input\_resource\_type\_list) | Список типов ресурсов. | `list(string)` | <pre>[<br/>  "vm",<br/>  "cluster",<br/>  "registry"<br/>]</pre> | no |
| <a name="input_security_group_web_egress"></a> [security\_group\_web\_egress](#input\_security\_group\_web\_egress) | n/a | <pre>list(object(<br/>        {<br/>            protocol = string<br/>            description = string<br/>            v4_cidr_blocks = list(string)<br/>            port = optional(number)<br/>            from_port = optional(number)<br/>            to_port = optional(number)<br/>        }<br/>    ))</pre> | <pre>[<br/>  {<br/>    "description": "Разрешить весь исходящий трафик",<br/>    "from_port": 0,<br/>    "protocol": "TCP",<br/>    "to_port": 65365,<br/>    "v4_cidr_blocks": [<br/>      "0.0.0.0/0"<br/>    ]<br/>  }<br/>]</pre> | no |
| <a name="input_security_group_web_ingress"></a> [security\_group\_web\_ingress](#input\_security\_group\_web\_ingress) | n/a | <pre>list(object(<br/>        {<br/>            protocol = string<br/>            description = string<br/>            v4_cidr_blocks = list(string)<br/>            port = optional(number)<br/>            from_port = optional(number)<br/>            to_port = optional(number)<br/>        }))</pre> | <pre>[<br/>  {<br/>    "description": "Разрешить входящий SSH",<br/>    "port": 22,<br/>    "protocol": "TCP",<br/>    "v4_cidr_blocks": [<br/>      "0.0.0.0/0"<br/>    ]<br/>  },<br/>  {<br/>    "description": "Разрешить входящий HTTP",<br/>    "port": 80,<br/>    "protocol": "TCP",<br/>    "v4_cidr_blocks": [<br/>      "0.0.0.0/0"<br/>    ]<br/>  },<br/>  {<br/>    "description": "Разрешить входящий HTTPS",<br/>    "port": 443,<br/>    "protocol": "TCP",<br/>    "v4_cidr_blocks": [<br/>      "0.0.0.0/0"<br/>    ]<br/>  }<br/>]</pre> | no |
| <a name="input_subnet_cidr_list"></a> [subnet\_cidr\_list](#input\_subnet\_cidr\_list) | Список CIDR для подсетей. | `list(string)` | <pre>[<br/>  "10.0.1.0/24",<br/>  "10.0.2.0/24"<br/>]</pre> | no |
| <a name="input_vm_docker_gpg_keyid"></a> [vm\_docker\_gpg\_keyid](#input\_vm\_docker\_gpg\_keyid) | Отпечаток GPG ключа APT репозитория Docker | `string` | `"9DC858229FC7DD38854AE2D88D81803C0EBFCD88"` | no |
| <a name="input_vm_git_branch"></a> [vm\_git\_branch](#input\_vm\_git\_branch) | Ветка репозитория из которой берутся файлы приложения. | `string` | `"main"` | no |
| <a name="input_vm_metadata"></a> [vm\_metadata](#input\_vm\_metadata) | Метаданные ВМ. | `map(string)` | n/a | yes |
| <a name="input_vm_params"></a> [vm\_params](#input\_vm\_params) | Параметры виртуальной машины. | <pre>list(object({<br/>        username = string<br/>        user_groups = list(string)<br/>        image_family = string<br/>        cores = number<br/>        memory = number<br/>        core_fraction = number<br/>        preemptible = bool<br/>        platform_id = string<br/>        nat = bool<br/>        disk_volume = number<br/>        packages = list(string)<br/>    }))</pre> | n/a | yes |
| <a name="input_vm_ssh_key_path"></a> [vm\_ssh\_key\_path](#input\_vm\_ssh\_key\_path) | Путь до публичного ssh ключа для подключения к ВМ. | `string` | `"~/.ssh/id_ed25519.pub"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->