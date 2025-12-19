module "network" {
  source = "./modules/network"

  vpc_cidr             = var.vpc_cidr
  public_subnets_cidr  = var.public_subnets_cidr
  private_subnets_cidr = var.private_subnets_cidr
  availability_zones   = var.availability_zones
}

module "security" {
  source = "./modules/security"

  vpc_id             = module.network.vpc_id
  allowed_https_cidr = ["0.0.0.0/0"]
}

module "compute" {
  source = "./modules/compute"

  subnet_id         = module.network.public_subnets[0]
  security_group_id = module.security.security_group_id
  iam_role_name     = module.security.iam_role_name
}