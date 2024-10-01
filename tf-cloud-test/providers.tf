terraform { 
  cloud { 
    hostname = "app.terraform.io"
    organization = "likimani-tf-cloud" 

    workspaces { 
      name = "likimani-dev-workspace" 
    } 
  }
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "~> 5.42.0"
    }

    aws = {
      source = "hashicorp/aws"
      version = "5.68.0"
    }
  }
}

provider "aws" {
  region = "ca-central-1"
}
provider "google" {
  region = "us-central1"
  project = "phyll-mamz-playground"
  impersonate_service_account = "terraform-tf-cloud-sa@phyll-mamz-playground.iam.gserviceaccount.com"
}

