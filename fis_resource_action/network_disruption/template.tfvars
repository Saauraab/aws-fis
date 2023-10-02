#Variable for FIS action on MQTT
name = "fis-auroradb-failover"
template_name = "fis-mqtt-experiment-template"
private_subnet_name = "public_c"
ec2_action_name = "network-disruption"
target_name = "Subnets-Target-2"
ec2_resource_type = "aws:ec2:subnet"
ec2_action_id = "aws:network:disrupt-connectivity"
aws_region = "us-east-1"