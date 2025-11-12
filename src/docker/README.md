<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~>1.9.1 |
| <a name="requirement_docker"></a> [docker](#requirement\_docker) | ~>3.6.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_docker"></a> [docker](#provider\_docker) | ~>3.6.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [docker_image.image](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/image) | resource |
| [docker_registry_image.image-remote](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/registry_image) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_docker_host"></a> [docker\_host](#input\_docker\_host) | Адрес Docker демона. | `string` | `"tcp://localhost:2375"` | no |
| <a name="input_docker_image_name"></a> [docker\_image\_name](#input\_docker\_image\_name) | Имя образа Docker. | `string` | n/a | yes |
| <a name="input_docker_image_tags"></a> [docker\_image\_tags](#input\_docker\_image\_tags) | Список тегов для образа Docker. | `list(string)` | n/a | yes |
| <a name="input_dockerfile_path"></a> [dockerfile\_path](#input\_dockerfile\_path) | Путь до Dockerfile. | `string` | n/a | yes |
| <a name="input_keep_image_locally"></a> [keep\_image\_locally](#input\_keep\_image\_locally) | Поведение относительно образа при terraform delete. | `bool` | `false` | no |
| <a name="input_registry_address"></a> [registry\_address](#input\_registry\_address) | Адрес удаленного реестра. | `string` | n/a | yes |
| <a name="input_registry_id"></a> [registry\_id](#input\_registry\_id) | ID реестра. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_docker_image_name"></a> [docker\_image\_name](#output\_docker\_image\_name) | n/a |
<!-- END_TF_DOCS -->