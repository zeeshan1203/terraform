//module "template" {
//  source = "./launch-template"
//}

module "ec2" {
  source            = "./ec2"
  COMPONENTS        = var.COMPONENTS
}

module "ansible" {
  depends_on        = [module.ec2]
  source            = "./ansible-apply"
  COMPONENTS        = var.COMPONENTS
}
