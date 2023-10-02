#Variable for FIS action on MQTT
name = "fis-mqtt"
template_name = "fis-mqtt-experiment-template"
private_subnet_name = "public_c"
action_name = "db_terminate"
target_name = "Clusters-Target-1"
resource_type = "aws:rds:cluster"
action_id = "aws:rds:failover-db-cluster"
aws_region = "us-east-1"