# AWS Fault Injection Simulator

##############################################################################################
## IAM role created to performt the db failover operation on the aurora db instances instances##
##############################################################################################
module "fis_mqtt_iam" {
  source               = "./modules/created_iam/"
  role_name            = var.role_name
  policy_name          = var.policy_name
  network_policy_name  = var.network_policy_name
  subnet_instances_arn = data.aws_instance.instance_detail[*].arn
}

##############################################################################################
## Resource aws_fis_experiment_template will invoke the stop the writer instance of the db ##
##############################################################################################
module "mqtt_ec2_template" {
  source            = "./modules/fis_ec2_terminate/"
  iam_role_arn      = module.fis_mqtt_iam.fis_iamrole_arn
  action_name       = var.action_name
  action_id         = var.action_id
  target_key        = var.target_key
  target_name       = var.target_name
  resource_type     = var.resource_type
  selection_mode    = var.selection_mode
  resource_arns     = data.aws_instance.instance_detail[*].arn
  fis_log_group_arn = "${module.cloudwatch_loggroup.fis_loggroup_arn}:*"
}

##############################################################################################
## Resource aws_fis_experiment_template will disrupt the network traffic ##
##############################################################################################
module "mqtt_network-disrupt-experiment_template" {
  source                  = "./modules/network_disruption/"
  instance_action_name    = var.instance_action_name
  instance_action_id      = var.instance_action_id
  instance_target_key     = var.instance_target_key
  instance_target_name    = var.instance_target_name
  instance_resource_type  = var.instance_resource_type
  instance_selection_mode = var.instance_selection_mode
  instance_resource_arns  = data.aws_instance.instance_detail[*].arn

  subnet_action_name    = var.subnet_action_name
  subnet_action_id      = var.subnet_action_id
  subnet_target_key     = var.subnet_target_key
  subnet_resource_type  = var.subnet_resource_type
  subnet_selection_mode = var.subnet_selection_mode
  duration              = var.duration
  scope                 = var.scope
  subnet_target_name    = var.subnet_target_name

  subnet_resource_arns = data.aws_subnet.private_subnet.arn
  fis_role_arn         = module.fis_mqtt_iam.fis_iamrole_arn
  fis_log_group_arn    = "${module.cloudwatch_loggroup.fis_loggroup_arn}:*"

}

##############################################################################################
## Resource aws_fis_experiment_template will disrupt the network traffic ##
##############################################################################################
module "cloudwatch_loggroup" {
  source            = "./modules/cloudwatch_log_group/"
  fis_loggroup_name = var.fis_loggroup_name
  retention_in_days = var.retention_in_days
}