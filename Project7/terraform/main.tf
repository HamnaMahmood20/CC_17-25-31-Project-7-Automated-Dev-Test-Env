


provider "aws" {
  shared_config_files      = ["~/.aws/config"]
  shared_credentials_files = ["~/.aws/credentials"]
}


module "network" {
  source              = "./modules/network"
  vpc_cidr            = "10.0.0.0/16"          # Optional: agar default change karna ho
  public_subnet_cidr  = "10.0.1.0/24"
  private_subnet_cidr = "10.0.2.0/24"
}

module "security" {
  source      = "./modules/security"
  vpc_id      = module.network.vpc_id      # Network module ka output yahan pass ho raha hai
  environment = var.environment            # Root variable se value aa rahi hai
  my_ip       = var.my_ip
}

module "compute" {
  source            = "./modules/compute"
  public_subnet_id  = module.network.public_subnet_id
  private_subnet_id = module.network.private_subnet_id
  proxy_sg_id       = module.security.proxy_sg_id
  web_sg_id         = module.security.web_sg_id
  environment       = var.environment
  instance_type     = var.instance_type
}