terraform {
  backend "s3" {
    bucket = "zero-downtime-deployment-tfstate-bucket"
    key    = "terraform.tfstate"
    region = "us-east-1"

  }
}
