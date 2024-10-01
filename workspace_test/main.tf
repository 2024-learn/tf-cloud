provider "tfe" {}

data "tfe_workspace" "tfe_workspace" {
  name         = var.workspace_name
  organization = var.organization
}

variable "workspace_name" {
  default = "likimani-dev-workspace"
}

variable "organization" {
  default = "likimani-tf-cloud"
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
resource "tfe_workspace" "new_dev_workspace" {
  name         = var.new_dev_workspace
  organization = var.organization
  project_id   = data.tfe_organization.tfcloud_org.default_project_id
}

variable "new_dev_workspace" {
  default = "tf-cloud-dev"
}


output "new_dev_workspace_id" {
  value = tfe_workspace.new_dev_workspace.id
}

output "new_dev_workspace_tf_version" {
  value = tfe_workspace.new_dev_workspace.terraform_version
}