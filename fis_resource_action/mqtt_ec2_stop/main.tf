# AWS Fault Injection Simulator
data "aws_caller_identity" "current" {}

locals {
     aws_account_id = data.aws_caller_identity.current.account_id
}

#############################################################################################################
## Resource aws_fis_experiment_template will invoke the stop action on all the ec2_instances in the subnet ##
#############################################################################################################
resource "aws_fis_experiment_template" "mqtt-experiment_template" {
  description = "Template created to stop the ec2_instance in a single AZ"
  role_arn    = aws_iam_role.fis_ec2_role.arn

  stop_condition {
    source = "none"
  }

   action {
    name      = var.ec2_action_name
    action_id = var.ec2_action_id

    target {
      key   = "Instances"
      value = var.target_name
    }
  }

  target {
    name           = var.target_name
    resource_type  = var.ec2_resource_type
    selection_mode = "ALL"
    resource_arns = data.aws_instance.instance_detail[*].arn
  }
}

#############################################################################################################
## IAM role created to performt the stop operation on the ec2 instances ##
#############################################################################################################
resource "aws_iam_role" "fis_ec2_role" {
  name = "fis_ec2_role"
  assume_role_policy = jsonencode({
    "Version" = "2012-10-17",
    "Statement" = [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "fis.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
  })

  tags = {
    tag-key = "tag-value"
  }
}

#############################################################################################################
## IAM policy will have the required permission to stop and start the instances ##
#############################################################################################################
resource "aws_iam_policy" "fis_iam_policy" {
  name = "fis_ec2_iam_policy"
  
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
             Sid = "AllowFISExperimentRoleEC2Actions",
             Effect = "Allow",
             Action = [
                "ec2:RebootInstances",
                "ec2:StopInstances",
                "ec2:StartInstances",
                "ec2:TerminateInstances"
            ],
             Resource = data.aws_instance.instance_detail[*].arn
        }
    ]
})
}

#############################################################################################################
## Resource aws_iam_role_policy_attachment created to attach the fis_iam_policy to IAM role ##
#############################################################################################################
resource "aws_iam_role_policy_attachment" "this" {

  role       = aws_iam_role.fis_ec2_role.name
  policy_arn = aws_iam_policy.fis_iam_policy.arn
}