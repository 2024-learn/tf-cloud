provider "tfe" {}

variable "workspace_name" {
  default = "tf-cloud-staging"
}

variable "organization" {
  default = "likimani-tf-cloud"
}

data "tfe_workspace" "tfe_workspace" {
  name = var.workspace_name
  organization = var.organization
}

output "workspace_id" {
  value = data.tfe_workspace.tfe_workspace.id
}

output "workspace_terraform_version" {
  value = data.tfe_workspace.tfe_workspace.terraform_version
}
