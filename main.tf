resource "aws_inspector2_delegated_admin_account" "delegated_inspector_admin_acc" {
  count      = var.inspector_organization_management_account ? 1 : 0
  account_id = var.organization_security_account_id
}

resource "aws_inspector2_enabler" "itgix_primary" {
  count          = var.inspector_organization_security_account ? 1 : 0
  account_ids    = [var.organization_management_account_id]
  resource_types = var.amazon_inspector_resources_to_scan
}

resource "aws_inspector2_organization_configuration" "itgix_primary" {
  count = var.inspector_organization_security_account ? 1 : 0
  auto_enable {
    ec2         = var.amazon_inspector_auto_enable_ec2_scanning
    ecr         = var.amazon_inspector_auto_enable_ecr_scanning
    lambda      = var.amazon_inspector_auto_enable_lambda_scanning
    lambda_code = var.amazon_inspector_auto_enable_lambda_code_scanning
  }

  depends_on = [aws_inspector2_enabler.delegated_admin_account]
}

resource "aws_inspector2_member_association" "itgix_primary" {
  count      = var.inspector_organization_security_account ? length(var.organization_member_account_ids) : 0
  account_id = var.organization_member_account_ids[count.index]
}

resource "aws_inspector2_enabler" "member_accounts" {
  count          = var.inspector_organization_security_account ? 1 : 0
  account_ids    = var.organization_member_account_ids
  resource_types = var.amazon_inspector_resources_to_scan
}
