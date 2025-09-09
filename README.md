The Terraform module is used by the ITGix AWS Landing Zone - https://itgix.com/itgix-landing-zone/

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_inspector2_enabler.member_accounts](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/inspector2_enabler) | resource |
| [aws_inspector2_member_association.itgix_primary](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/inspector2_member_association) | resource |
| [aws_inspector2_organization_configuration.itgix_primary](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/inspector2_organization_configuration) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_amazon_inspector_auto_enable_ec2_scanning"></a> [amazon\_inspector\_auto\_enable\_ec2\_scanning](#input\_amazon\_inspector\_auto\_enable\_ec2\_scanning) | (Required) Whether Amazon EC2 scans are automatically enabled for new members of your Amazon Inspector organization. | `bool` | `true` | no |
| <a name="input_amazon_inspector_auto_enable_ecr_scanning"></a> [amazon\_inspector\_auto\_enable\_ecr\_scanning](#input\_amazon\_inspector\_auto\_enable\_ecr\_scanning) | (Required) Whether Amazon ECR scans are automatically enabled for new members of your Amazon Inspector organization. | `bool` | `true` | no |
| <a name="input_amazon_inspector_auto_enable_lambda_code_scanning"></a> [amazon\_inspector\_auto\_enable\_lambda\_code\_scanning](#input\_amazon\_inspector\_auto\_enable\_lambda\_code\_scanning) | (Optional) Whether AWS Lambda code scans are automatically enabled for new members of your Amazon Inspector organization. Note: Lambda code scanning requires Lambda standard scanning to be activated. Consequently, if you are setting this argument to true, you must also set the lambda argument to true | `bool` | `false` | no |
| <a name="input_amazon_inspector_auto_enable_lambda_scanning"></a> [amazon\_inspector\_auto\_enable\_lambda\_scanning](#input\_amazon\_inspector\_auto\_enable\_lambda\_scanning) | (Optional) Whether Lambda Function scans are automatically enabled for new members of your Amazon Inspector organization. | `bool` | `false` | no |
| <a name="input_amazon_inspector_resources_to_scan"></a> [amazon\_inspector\_resources\_to\_scan](#input\_amazon\_inspector\_resources\_to\_scan) | (Required) Type of resources to scan. Valid values are EC2, ECR, LAMBDA and LAMBDA\_CODE. At least one item is required. | `list(any)` | <pre>[<br/>  "EC2",<br/>  "ECR"<br/>]</pre> | no |
| <a name="input_inspector_organization_management_account"></a> [inspector\_organization\_management\_account](#input\_inspector\_organization\_management\_account) | Set to true when running from organization management account to configure the Guardduty delegated admin | `bool` | `false` | no |
| <a name="input_inspector_organization_security_account"></a> [inspector\_organization\_security\_account](#input\_inspector\_organization\_security\_account) | Set to true when running from organization security account to configure the Guardduty in the organization and invite member accounts | `bool` | `false` | no |
| <a name="input_organization_member_account_ids"></a> [organization\_member\_account\_ids](#input\_organization\_member\_account\_ids) | List of member account IDs where guarduty will be enabled | `list(any)` | `[]` | no |
| <a name="input_organization_security_account_id"></a> [organization\_security\_account\_id](#input\_organization\_security\_account\_id) | The account ID of the organization security account | `string` | `""` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
