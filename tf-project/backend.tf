terraform {
  backend "s3" {
    bucket  = "coodesh-s3"
    key     = "local/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}
