provider "tfe" {}

<<<<<<< HEAD
=======
variable "workspace_name" {
  default = "likimani-dev-workspace"
}

variable "organization" {
  default = "likimani-tf-cloud"
}

>>>>>>> 18234b8 (merge repos and tfe provider added)
data "tfe_workspace" "tfe_workspace" {
  name = var.workspace_name
  organization = var.organization
}

output "workspace_id" {
  value = data.tfe_workspace.tfe_workspace.id
}

output "workspace_terraform_version" {
  value = data.tfe_workspace.tfe_workspace.terraform_version
<<<<<<< HEAD
}
=======
}
>>>>>>> 18234b8 (merge repos and tfe provider added)
