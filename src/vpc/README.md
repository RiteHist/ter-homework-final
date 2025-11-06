<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~>1.9.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [yandex_vpc_network.vpc-network](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_network) | resource |
| [yandex_vpc_subnet.vpc-subnet](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_subnet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_env"></a> [env](#input\_env) | Имя окружения для VPC | `string` | n/a | yes |
| <a name="input_subnet_map"></a> [subnet\_map](#input\_subnet\_map) | Имя подсети и соответствующий блок CIDR | `map(string)` | n/a | yes |
| <a name="input_zone"></a> [zone](#input\_zone) | Зона доступности | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_network_info"></a> [network\_info](#output\_network\_info) | n/a |
| <a name="output_subnet_info"></a> [subnet\_info](#output\_subnet\_info) | n/a |
<!-- END_TF_DOCS -->