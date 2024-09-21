resource "aws_vpc" "test_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "google_storage_bucket" "my_storage_bucket" {
  name          = "likimani-staging-no-public-access"
  location      = "US"
  force_destroy = true

  public_access_prevention = "enforced"
}

resource "google_storage_bucket" "staging_storage_bucket" {
  name          = "likimani-staging-public-access"
  location      = "US"
  force_destroy = true

  public_access_prevention = "enforced"
}

resource "google_storage_bucket" "public_storage_bucket" {
  name          = "likimani-public-access-bucket"
  location      = "US"
  force_destroy = true
}
