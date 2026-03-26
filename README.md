The Terraform module is used by the ITGix AWS Landing Zone - https://itgix.com/itgix-landing-zone/

# AWS Inspector Terraform Module

This module enables Amazon Inspector v2 across an AWS Organization with delegated admin, member account associations, and configurable scanning types.

Part of the [ITGix AWS Landing Zone](https://itgix.com/itgix-landing-zone/).

## Resources Created

- Inspector v2 enabler for specified resource types
- Delegated administrator configuration
- Organization member account associations
- Auto-enable settings for new member accounts

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| `inspector_organization_management_account` | Set to true when running from organization management account | `bool` | `false` | no |
| `inspector_organization_security_account` | Set to true when running from organization security account | `bool` | `false` | no |
| `organization_member_account_ids` | List of member account IDs where Inspector will be enabled | `list(any)` | `[]` | no |
| `organization_security_account_id` | The account ID of the organization security account | `string` | `""` | no |
| `amazon_inspector_resources_to_scan` | Type of resources to scan (EC2, ECR, LAMBDA, LAMBDA_CODE) | `list(any)` | `["EC2", "ECR"]` | no |
| `amazon_inspector_auto_enable_ec2_scanning` | Auto-enable EC2 scans for new members | `bool` | `true` | no |
| `amazon_inspector_auto_enable_ecr_scanning` | Auto-enable ECR scans for new members | `bool` | `true` | no |
| `amazon_inspector_auto_enable_lambda_scanning` | Auto-enable Lambda scans for new members | `bool` | `false` | no |
| `amazon_inspector_auto_enable_lambda_code_scanning` | Auto-enable Lambda code scans for new members | `bool` | `false` | no |

## Usage Example

```hcl
module "inspector" {
  source = "path/to/tf-module-aws-inspector"

  inspector_organization_security_account = true
  organization_security_account_id        = "111111111111"

  organization_member_account_ids = [
    "222222222222",
    "333333333333"
  ]

  amazon_inspector_resources_to_scan         = ["EC2", "ECR", "LAMBDA"]
  amazon_inspector_auto_enable_lambda_scanning = true
}
```
