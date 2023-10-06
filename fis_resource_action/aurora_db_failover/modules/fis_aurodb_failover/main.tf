# AWS Fault Injection Simulator for auroradb


##############################################################################################
## Resource aws_fis_experiment_template will invoke the stop the writer instance of the db ##
##############################################################################################
resource "aws_fis_experiment_template" "auroradb-experiment_template" {
  description = "Template created to perform the FIS on aurodb failover"
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
    resource_arns = var.resource_arns
  }
  log_configuration {
        cloudwatch_logs_configuration {
            log_group_arn = "arn:aws:logs:us-east-1:227622396901:log-group:fis_aurodb_failover_loggroup:*"
        }
        log_schema_version = 2
    }

}