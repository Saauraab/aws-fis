##############################################################################################
## IAM role created to performt the db failover operation on the aurora db instances instances##
##############################################################################################
module "fis_ssm_iam" {
  source      = "./modules/created-iam/"
  role_name   = var.role_name
  policy_name = var.policy_name
}

module "fis_ssm" {
  source            = "./modules/fis-ssm/"
  impacted_az       = var.impacted_az
  autoscaling_group = var.autoscaling_group
  assumeRole        = var.assumeRole
  duration          = var.duration
  name              = var.name
}
