terraform {
  backend "s3" {
    bucket            = "terraform-szs"
    key               = "roboshop/terraform.tfstate"
    region            = "us-east-1"
    dynamodb_table    = "terraform"
  }
}
