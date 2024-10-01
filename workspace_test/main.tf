data "tfe_workspace" "tfe_workspace" {
  name         = var.workspace_name
  organization = var.organization
}

data "tfe_organization" "tfcloud_org" {
  name = "likimani-tf-cloud"
}

resource "tfe_workspace" "tf-cloud-dev" {
  name              = var.new_dev_workspace
  organization      = var.organization
  project_id        = data.tfe_organization.tfcloud_org.default_project_id
  terraform_version = var.tf_version
}

resource "tfe_variable" "managed" {
  key          = "new_variable_key"
  value        = "new_variable_value"
  category     = "terraform"
  workspace_id = tfe_workspace.tf-cloud-dev.id
  description  = "example of a regular var"
}

resource "tfe_variable" "sensitive" {
  key          = "sensitive_variable_key"
  value        = "sensitive_variable_value"
  category     = "terraform"
  workspace_id = tfe_workspace.tf-cloud-dev.id
  description  = "example of a sensitive var"
  sensitive    = true
}

resource "tfe_variable" "hcl" {
  key          = "hcl_variable_key"
  value        = "[hcl_variable_value]"
  category     = "terraform"
  workspace_id = tfe_workspace.tf-cloud-dev.id
  description  = "variable written in HCL form"
  hcl          = true
}