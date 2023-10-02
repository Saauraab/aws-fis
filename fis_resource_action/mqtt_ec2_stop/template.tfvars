#Variable for FIS action on MQTT
name = "fis-mqtt"
template_name = "fis-mqtt-experiment-template"
private_subnet_name = "public_c"
ec2_action_name = "stop-ec2-action"
target_name = "Instances-Target-1"
ec2_resource_type = "aws:ec2:instance"
ec2_action_id = "aws:ec2:stop-instances"
aws_region = "us-east-1"