terraform {
  backend "s3" {
    bucket = "saauraab-terraform-bucket-fis"
    key    = "fis/aurodab-fis.tfstate"
    region = "eu-central-1"
  }
}