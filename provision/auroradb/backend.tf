terraform {
  backend "s3" {
    bucket = "saauraab-terraform-bucket-fis"
    key    = "fis/rds.tfstate"
    region = "eu-central-1"
  }
}