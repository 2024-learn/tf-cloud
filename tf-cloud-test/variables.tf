# Uncomment these variables if using the workspace level variables. Errors if organization level variables

# variable "AWS_ACCESS_KEY_ID"{}
# variable "AWS_SECRET_ACCESS_KEY" {}
# variable "GOOGLE_CREDENTIALS"{}
variable "workspace_env" {
  default = "prod"
}
