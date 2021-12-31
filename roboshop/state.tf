terraform {
  backend "s3" {
    bucket            = "terraform-szs"           ##ur bucket name
    key               = "roboshop/terraform.tfstate"
    region            = "us-east-1"
    dynamodb_table    = "terraform"
  }
}

provider "aws" {
  region = "us-east-1"
}
