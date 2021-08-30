//module "template" {
//  source = "./launch-template"
//}

module "frontend" {
  source            = "./ec2"
  COMPONENTS        = var.COMPONENTS
}

module "ansible" {
  depends_on        = [module.frontend]
  source            = "./ansible-apply"
  COMPONENTS        = var.COMPONENTS
}
