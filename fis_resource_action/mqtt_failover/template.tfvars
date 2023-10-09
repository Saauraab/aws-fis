#Variable for FIS action on MQTT
name                = "fis-mqtt"
aws_region          = "us-east-1"
action_name         = "terminate-ec2-action"
target_name         = "Instances-Target-1"

#Variables for FIS action on ec2 terminate for a terminate_ec2_template
resource_type       = "aws:ec2:instance"
action_id           = "aws:ec2:stop-instances"
target_key          = "Instances"
selection_mode      = "ALL"
role_name           = "fis_mqtt_role"
policy_name         = "fis_ec2_simulator_policy"
network_policy_name = "fis_network_simulator_policy"

#Variable for FIS simulation for a network outage 
subnet_action_name    = "subnet_down"
subnet_action_id      = "aws:network:disrupt-connectivity"
subnet_target_key     = "Subnets"
subnet_resource_type  = "aws:ec2:subnet"
subnet_selection_mode = "ALL"
subnet_target_name    = "Subnets-Target-2"
duration              = "PT10M"
scope                 = "all"
fis_loggroup_name     = "fis_loggroup"

#Variables for FIS action on ec2 terminate for the mqtt-fis-experiment-template
instance_action_name    = "terminate-ec2-action"
instance_action_id      = "aws:ec2:stop-instances"
instance_target_key     = "Instances"
instance_target_name    = "Instances-Target-1"
instance_resource_type  = "aws:ec2:instance"
instance_selection_mode = "ALL"


retention_in_days = 7

#Variable for FIS action on MQTT
private_subnet_name = "public_c"
private_subnet_id   = "subnet-021e94f37fb7fc672"