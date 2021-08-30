//module "template" {
//  source = "./launch-template"
//}

module "frontend" {
  source            = "./ec2"
  COMPONENTS        = var.COMPONENTS
}
