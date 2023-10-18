#Variable for FIS action on AuroraDB
name               = "fis-auroradb"
action_name        = "db_terminate"
target_name        = "Clusters-Target-1"
resource_type      = "aws:rds:cluster"
action_id          = "aws:rds:failover-db-cluster"
aws_region         = "eu-west-1"
cluster_identifier = "ex-auroradb"
target_key         = "Clusters"
selection_mode     = "ALL"

#Variable for FIS action on network outage
subnet_action_name    = "subnet_down"
subnet_action_id      = "aws:network:disrupt-connectivity"
subnet_target_key     = "Subnets"
subnet_resource_type  = "aws:ec2:subnet"
subnet_selection_mode = "ALL"
duration              = "PT10M"
scope                 = "all"

#Variable for FIS action on auroradb failover
instance_action_name    = "db_terminate"
instance_action_id      = "aws:rds:failover-db-cluster"
instance_target_key     = "Clusters"
instance_target_name    = "Clusters-Target-1"
instance_resource_type  = "aws:rds:cluster"
instance_selection_mode = "ALL"
private_subnet_id       = "subnet-0c305f9dbd4dd8283"
subnet_target_name      = "Subnets-Target-2"

network_policy_name = "fis_rds_network_simulator_policy"
role_name          = "fis-rds-failover-role"
policy_name        = "fis-rds-failover-policy"
fis_loggroup_name  = "fis-loggroup"
retention_in_days = 7