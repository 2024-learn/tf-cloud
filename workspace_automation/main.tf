data "tfe_workspace" "tfe_workspace" {
  name         = var.workspace_name
  organization = var.organization
}

output "workspace_id" {
  value = data.tfe_workspace.tfe_workspace.id
}

output "workspace_terraform_version" {
  value = data.tfe_workspace.tfe_workspace.terraform_version
}

data "tfe_organization" "tfcloud_org" {
  name = "likimani-tf-cloud"
}
output "tfe_project_id" {
  value = data.tfe_organization.tfcloud_org.default_project_id
}
