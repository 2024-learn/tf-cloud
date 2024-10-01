# data "tfe_workspace" "tfe_workspace" {
#   name         = var.workspace_name
#   organization = var.organization
# }

output "workspace_id" {
  value = data.tfe_workspace.tfe_workspace.id
}

output "workspace_terraform_version" {
  value = data.tfe_workspace.tfe_workspace.terraform_version
}

resource "tfe_workspace" "new_dev_workspace" {
  name         = var.new_dev_workspace
  organization = var.organization
}

output "new_dev_workspace_id" {
  value = tfe_workspace.new_dev_workspace.id
}

output "new_dev_workspace_tf_version" {
  value = tfe_workspace.new_dev_workspace.terraform_version
}