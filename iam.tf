module "cloud-storage" {
  source  = "app.terraform.io/likimani-tf-cloud/cloud-storage/google"
  version = "6.1.0"
  # insert required variables here
  project_id = "phyll-mamz-playground"
  names = ["dev-storage", "staging-storage"]
  prefix = "likimani-tf-cloud"
  set_admin_roles = true
  admins = ["user:phyllis@phyllmamz.com", "user:mambo@phyllmamz.com"]
  versioning = {
    # first = true
    enabled = true
  }
  bucket_admins = {
    second = "user:phyllis@phyllmamz.com,user:mambo@phyllmamz.com"
  }
}