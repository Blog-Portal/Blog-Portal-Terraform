module "namespace" {
  source    = "./module/namespace"
  namespace = var.namespace
}

module "mongodb" {
  source               = "./module/mongodb"
  namespace            = var.namespace
  mongodb_service_name = var.mongodb_service_name
}

module "react" {
  source             = "./module/react"
  namespace          = var.namespace
  react_service_name = var.react_service_name
  frontend_image     = var.frontend_image
}

module "springboot" {
  source                  = "./module/springboot"
  namespace               = var.namespace
  springboot_service_name = var.springboot_service_name
  mongodb_service_name    = var.mongodb_service_name
  backend_image           = var.backend_image
  admin_email             = var.admin_email
  admin_password          = var.admin_password
  admin_first_name        = var.admin_first_name
  admin_last_name         = var.admin_last_name
}
