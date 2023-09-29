# AWS Fault Injection Simulator
data "aws_caller_identity" "current" {}

locals {
     aws_account_id = data.aws_caller_identity.current.account_id
}

resource "aws_fis_experiment_template" "mqtt-experiment_template" {
  description = "Template created to stop the ec2_instance in a single AZ"
  role_arn    = "arn:aws:iam::227622396901:role/service-role/AWSFISIAMRole-1695711430940"

  stop_condition {
    source = "none"
  }

  action {
    name      = var.action_name
    action_id = var.ec2_action_id

    target {
      key   = "Instances"
      value = "Instances-Target-1"
    }
  }

  target {
    name           = "Instances-Target-1"
    resource_type  = var.ec2_resource_type
    selection_mode = "ALL"
    resource_arns = data.aws_instance.instance_detail[*].arn
  }
}

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
             Resource = "arn:aws:ec2:${var.aws_region}:${data.aws_caller_identity.current.account_id}:instance/*"
        }
    ]
})
}

resource "aws_iam_role_policy_attachment" "this" {

  role       = aws_iam_role.fis_ec2_role.name
  policy_arn = aws_iam_policy.fis_iam_policy.arn
}