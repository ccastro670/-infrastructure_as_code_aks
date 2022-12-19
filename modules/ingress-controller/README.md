<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.3.6 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | ~> 2.8.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | ~> 2.8.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.ingress_controller](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_name_ingress"></a> [application\_name\_ingress](#input\_application\_name\_ingress) | n/a | `string` | n/a | yes |
| <a name="input_chart_name_ingress"></a> [chart\_name\_ingress](#input\_chart\_name\_ingress) | n/a | `string` | n/a | yes |
| <a name="input_create_namespace_ingress"></a> [create\_namespace\_ingress](#input\_create\_namespace\_ingress) | n/a | `bool` | n/a | yes |
| <a name="input_namespace_name_ingress"></a> [namespace\_name\_ingress](#input\_namespace\_name\_ingress) | n/a | `string` | n/a | yes |
| <a name="input_repository"></a> [repository](#input\_repository) | Helm repository | `string` | n/a | yes |
| <a name="input_version_release_ingress"></a> [version\_release\_ingress](#input\_version\_release\_ingress) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->