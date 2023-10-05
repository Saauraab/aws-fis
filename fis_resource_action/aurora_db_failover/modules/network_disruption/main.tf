resource "aws_fis_experiment_template" "network-experiment_template" {
  description = "Template created to stop the ec2_instance in a single AZ"
  role_arn    = "arn:aws:iam::227622396901:role/aws-service-role/fis.amazonaws.com/AWSServiceRoleForFIS"

  stop_condition {
    source = "none"
  }

  action {
    name      = var.subnet_action_name
    action_id = var.subnet_action_id

    target {
      key   = var.subnet_target_key
      value = var.subnet_target_name
    }
  }
  
  action {
    name      = var.instance_action_name
    action_id = var.instance_action_id

    target {
      key   = var.instance_target_key
      value = var.instance_target_name
    }
      parameter {
      key = "duration"
      value = var.duration 
    }
    
  parameter {
      key = "scope"
      value = var.scope
    }
  }

  target {
    name           = var.subnet_target_name
    resource_type  = var.subnet_resource_type
    selection_mode = var.subnet_selection_mode
    resource_arns = [var.subnet_resource_arns]
  }

  target {
    name           = var.instance_target_name
    resource_type  = var.instance_resource_type
    selection_mode = var.instance_selection_mode
    resource_arns = [var.instance_resource_arns]
  }
}