# AWS Fault Injection Simulator for auroradb

##############################################################################################
## Resource network-experiment_template will perform the failover on the auroradb
## It will deny the traffic to the subnet defined for a specific time
##############################################################################################

resource "aws_fis_experiment_template" "network-experiment_template" {
  description = "Template created to stop the ec2_instance in a single AZ"
  role_arn    = var.fis_role_arn

  stop_condition {
    source = "none"
  }
 
## Action created to deny the traffic on a subnet
  action {
    name      = var.subnet_action_name
    action_id = var.subnet_action_id
    
    parameter {
      key = "duration"
      value = var.duration 
    }
    
  parameter {
      key = "scope"
      value = var.scope
    }

    target {
      key   = var.subnet_target_key
      value = var.subnet_target_name
    }
  }
  
  target {
    name           = var.subnet_target_name
    resource_type  = var.subnet_resource_type
    selection_mode = var.subnet_selection_mode
    resource_arns = [var.subnet_resource_arns]
  }

## Action created to perform the auroradb failover
  action {
    name      = var.instance_action_name
    action_id = var.instance_action_id

    target {
      key   = var.instance_target_key
      value = var.instance_target_name
    }
  }

  target {
    name           = var.instance_target_name
    resource_type  = var.instance_resource_type
    selection_mode = var.instance_selection_mode
    resource_arns = [var.instance_resource_arns]
  }
  
## Log configuration defined for logging the FIS activity in the cloudwatch  
  log_configuration {
        cloudwatch_logs_configuration {
            log_group_arn = var.fis_log_group_arn
        }
        log_schema_version = 2
    }
}
