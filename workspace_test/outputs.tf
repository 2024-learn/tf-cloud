output "workspace_id" {
  value = data.tfe_workspace.tfe_workspace.id
}

output "workspace_terraform_version" {
  value = data.tfe_workspace.tfe_workspace.terraform_version
}

output "tfe_project_id" {
  value = data.tfe_organization.tfcloud_org.default_project_id
}

output "new_dev_workspace_id" {
  value = tfe_workspace.tf-cloud-dev.id
}

output "new_dev_workspace_tf_version" {
  value = tfe_workspace.tf-cloud-dev.terraform_version
}