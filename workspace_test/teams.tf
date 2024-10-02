# 
# data "tfe_team" "tfe_engineers" {
#   name = "tfe_engineers"
#   organization = var.organization
# }

# create a new team called "tfe_engineers" on with terraform and then create access for it
resource "tfe_team" "tfe_engineers" {
  depends_on = [ tfe_workspace.tf-cloud-dev ]
  name         = "tfe_engineers"
  organization = var.organization
  organization_access {
    manage_policies         = true
    manage_policy_overrides = true
    manage_projects         = true
    manage_vcs_settings     = true
    manage_workspaces       = true
    manage_run_tasks        = true
  }
}

data "tfe_workspace_ids" "all_workspace_ids" {
  names        = ["*"]
  organization = var.organization
}

# Give tfe_ngineers team read access to all workspaces in the organization
resource "tfe_team_access" "tfe_engineers_access" {
  depends_on = [ tfe_team.tfe_engineers, tfe_workspace.tf-cloud-dev ]
  for_each = data.tfe_workspace_ids.all_workspace_ids.ids
  access   = "read"
  # team_id      = data.tfe_team.tfe_engineers.id
  team_id      = tfe_team.tfe_engineers.id
  workspace_id = each.value
}