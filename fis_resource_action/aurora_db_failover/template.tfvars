#Variable for FIS action on MQTT
name = "fis-auroradb"
template_name = "fis-mqtt-experiment-template"
action_name = "db_terminate"
target_name = "Clusters-Target-1"
resource_type = "aws:rds:cluster"
action_id = "aws:rds:failover-db-cluster"
aws_region = "us-east-1"
cluster_identifier= "fisstackrdsaurora-fisworkshoprdsauroraee7bf768-qjnokg3dd1x3"