# AWS Fault Injection Simulator for auroradb

##############################################################################################
## Resource aws_fis_experiment_template will invoke the stop the writer instance of the db ##
##############################################################################################
resource "aws_fis_experiment_template" "mqtt-ec2-experiment-template" {
  description = "Template created to stop the ec2_instance in a single AZ"
  role_arn    = var.iam_role_arn
  stop_condition {
    source = "none"
  }

   action {
    name      = var.action_name
    action_id = var.action_id

    target {
      key   = var.target_key
      value = var.target_name
    }
    
  }

  target {
    name           = var.target_name
    resource_type  = var.resource_type
    selection_mode = var.selection_mode
    resource_arns =  var.resource_arns
  }
  log_configuration {
        cloudwatch_logs_configuration {
            log_group_arn = var.fis_log_group_arn
        }
        log_schema_version = 2
    }
}