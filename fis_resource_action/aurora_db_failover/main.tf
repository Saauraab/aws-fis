# AWS Fault Injection Simulator

##############################################################################################
## IAM role created to performt the db failover operation on the aurora db instances instances##
##############################################################################################
module "fis_rds_iam" {
  source            = "./modules/created_iam/"
  role_name         = var.role_name
  policy_name       = var.policy_name
  rds_cluster_arn   = data.aws_rds_cluster.aurora_db_cluser_detail.arn
  rds_instances_arn = data.aws_db_instances.db_instance_arns.instance_arns
}

##############################################################################################
## Resource aws_fis_experiment_template will invoke the stop the writer instance of the db ##
##############################################################################################
module "auroradb-experiment_template" {
  source             = "./modules/fis_aurodb_failover/"
  iam_role_arn       = module.fis_rds_iam.fis_iamrole_arn
  action_name        = var.action_name
  action_id          = var.action_id
  target_key         = var.target_key
  target_name        = var.target_name
  resource_type      = var.resource_type
  selection_mode     = var.selection_mode
  resource_arns      = [data.aws_rds_cluster.aurora_db_cluser_detail.arn]
  cluster_identifier = var.cluster_identifier
}

##############################################################################################
## Resource aws_fis_experiment_template will disrupt the network traffic ##
##############################################################################################
module "network-disrupt-experiment_template" {
  source                  = "./modules/network_disruption/"
  instance_action_name    = var.instance_action_name
  instance_action_id      = var.instance_action_id
  instance_target_key     = var.instance_target_key
  instance_target_name    = var.instance_target_name
  instance_resource_type  = var.instance_resource_type
  instance_selection_mode = var.instance_selection_mode
  instance_resource_arns  = data.aws_rds_cluster.aurora_db_cluser_detail.arn

  subnet_action_name    = var.subnet_action_name
  subnet_action_id      = var.subnet_action_id
  subnet_target_key     = var.subnet_target_key
  subnet_resource_type  = var.subnet_resource_type
  subnet_selection_mode = var.subnet_selection_mode
  duration              = var.duration
  scope                 = var.scope
  subnet_target_name    = var.subnet_target_name

  subnet_resource_arns = var.subnet_resource_arns
}
