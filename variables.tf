variable "organization_management_account_id" {
  type        = string
  description = "The account ID of the organization managemnet account"
  default     = ""
}

variable "inspector_organization_management_account" {
  type        = bool
  default     = false
  description = "Set to true when running from organization management account to configure the Guardduty delegated admin"
}

variable "inspector_organization_security_account" {
  type        = bool
  default     = false
  description = "Set to true when running from organization security account to configure the Guardduty in the organization and invite member accounts"
}


variable "organization_member_account_ids" {
  type        = list(any)
  description = "List of member account IDs where guarduty will be enabled"
  default     = []
}

variable "organization_security_account_id" {
  type        = string
  description = "The account ID of the organization security account"
  default     = ""
}

variable "amazon_inspector_resources_to_scan" {
  type        = list(any)
  default     = ["ECR", "EC2"]
  description = "(Required) Type of resources to scan. Valid values are EC2, ECR, LAMBDA and LAMBDA_CODE. At least one item is required."
}

variable "amazon_inspector_auto_enable_ec2_scanning" {
  type        = bool
  default     = true
  description = "(Required) Whether Amazon EC2 scans are automatically enabled for new members of your Amazon Inspector organization."
}

variable "amazon_inspector_auto_enable_ecr_scanning" {
  type        = bool
  default     = true
  description = "(Required) Whether Amazon ECR scans are automatically enabled for new members of your Amazon Inspector organization."
}

variable "amazon_inspector_auto_enable_lambda_scanning" {
  type        = bool
  default     = false
  description = "(Optional) Whether Lambda Function scans are automatically enabled for new members of your Amazon Inspector organization."
}

variable "amazon_inspector_auto_enable_lambda_code_scanning" {
  type        = bool
  default     = false
  description = "(Optional) Whether AWS Lambda code scans are automatically enabled for new members of your Amazon Inspector organization. Note: Lambda code scanning requires Lambda standard scanning to be activated. Consequently, if you are setting this argument to true, you must also set the lambda argument to true"
}
