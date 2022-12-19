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
| [helm_release.argocd](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_name_argocd"></a> [application\_name\_argocd](#input\_application\_name\_argocd) | n/a | `string` | n/a | yes |
| <a name="input_chart_name_argocd"></a> [chart\_name\_argocd](#input\_chart\_name\_argocd) | n/a | `string` | n/a | yes |
| <a name="input_create_namespace_argocd"></a> [create\_namespace\_argocd](#input\_create\_namespace\_argocd) | n/a | `bool` | n/a | yes |
| <a name="input_namespace_name_argocd"></a> [namespace\_name\_argocd](#input\_namespace\_name\_argocd) | n/a | `string` | n/a | yes |
| <a name="input_repository_argocd"></a> [repository\_argocd](#input\_repository\_argocd) | Helm repository | `string` | n/a | yes |
| <a name="input_version_release_argocd"></a> [version\_release\_argocd](#input\_version\_release\_argocd) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->