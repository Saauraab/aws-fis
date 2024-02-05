terraform {
  backend "s3" {
    bucket = "saauraab-terraform-bucket"
    key    = "fis/multi-az-terraform.tfstate"
    region = "eu-central-1"
  }
}