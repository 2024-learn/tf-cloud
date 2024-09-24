# module "cloud-storage" {
#   source  = "app.terraform.io/likimani-tf-cloud/cloud-storage/google"
#   version = "6.1.0"
#   # insert required variables here
#   project_id = "phyll-mamz-playground"
#   names = ["backend-bucket", "app-bucket"]
#   prefix = "likimani-tf-cloud-${var.workspace_env}"
#   set_admin_roles = true
#   admins = ["user:phyllis@phyllmamz.com", "user:mambo@phyllmamz.com"]
#   versioning = {
#     # first = true
#     enabled = true
#   }
#   bucket_admins = {
#     second = "user:phyllis@phyllmamz.com,user:mambo@phyllmamz.com"
#   }
# }