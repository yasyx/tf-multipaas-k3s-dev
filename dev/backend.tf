# provider "alicloud" {
  
# }

terraform {
  backend "oss" {
    bucket = "tf-state"
  }
}