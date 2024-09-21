resource "aws_vpc" "test_vpc" {
  cidr_block = "10.0.0.0/16"
}
resource "google_storage_bucket" "my_storage_bucket" {
  name          = "likimani-no-public-access-bucket"
  location      = "US"
  force_destroy = true

  public_access_prevention = "enforced"
}
