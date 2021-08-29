module "ec2" {
  source = "./ec2"
  sg_id = module.securitygroup.sg_id
}

module "securitygroup" {
  source = "./securitygroup"
}

provider "aws" {
  region = "us-east-1"
}
