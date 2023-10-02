# AWS Fault Injection Simulator
data "aws_caller_identity" "current" {}

locals {
     aws_account_id = data.aws_caller_identity.current.account_id
}

/*
Resource aws_fis_experiment_template will invoke the stop action on all the ec2_instances in the subnet
*/

resource "aws_fis_experiment_template" "mqtt-experiment_template" {
  description = "Template created to stop the ec2_instance in a single AZ"
  role_arn    = aws_iam_role.fis_network_role.arn

  stop_condition {
    source = "none"
  }

   action {
    name      = var.ec2_action_name
    action_id = var.ec2_action_id

    target {
      key   = "Subnets"
      value = "Instances-Target-2"
    }
    
    parameter = [
    {
      key = "duration"
      value = "PT10M" 
    },
    {
      key = "scope"
      value = "availability-zone" 
    }]
    
  }

  target {
    name           = "Instances-Target-2"
    resource_type  = var.ec2_resource_type
    selection_mode = "ALL"
    resource_arns = ["arn:aws:ec2:us-east-1:227622396901:subnet/subnet-021e94f37fb7fc672"]
  }
}

/*
IAM role created to performt the stop operation on the ec2 instances
*/

resource "aws_iam_role" "fis_network_role" {
  name = "fis_network_disruption_role"
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

/*
IAM policy will have the required permission to stop and start the instances
*/
resource "aws_iam_policy" "fis_network_iam_policy" {
  name = "fis_network_disruption_policy"
  
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "ec2:CreateTags",
            "Resource": "arn:aws:ec2:*:*:network-acl/*",
            "Condition": {
                "StringEquals": {
                    "ec2:CreateAction": "CreateNetworkAcl",
                    "aws:RequestTag/managedByFIS": "true"
                }
            }
        },
        {
            "Effect": "Allow",
            "Action": "ec2:CreateNetworkAcl",
            "Resource": "arn:aws:ec2:*:*:network-acl/*",
            "Condition": {
                "StringEquals": {
                    "aws:RequestTag/managedByFIS": "true"
                }
            }
        },
        {
            "Effect": "Allow",
            "Action": [
                "ec2:CreateNetworkAclEntry",
                "ec2:DeleteNetworkAcl"
            ],
            "Resource": [
                "arn:aws:ec2:*:*:network-acl/*",
                "arn:aws:ec2:*:*:vpc/*"
            ],
            "Condition": {
                "StringEquals": {
                    "ec2:ResourceTag/managedByFIS": "true"
                }
            }
        },
        {
            "Effect": "Allow",
            "Action": "ec2:CreateNetworkAcl",
            "Resource": "arn:aws:ec2:*:*:vpc/*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "ec2:DescribeVpcs",
                "ec2:DescribeManagedPrefixLists",
                "ec2:DescribeSubnets",
                "ec2:DescribeNetworkAcls"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": "ec2:ReplaceNetworkAclAssociation",
            "Resource": [
                "arn:aws:ec2:*:*:subnet/*",
                "arn:aws:ec2:*:*:network-acl/*"
            ]
        },
        {
            "Effect": "Allow",
            "Action": "ec2:GetManagedPrefixListEntries",
            "Resource": "arn:aws:ec2:*:*:prefix-list/*"
        }
    ]
})
}

/*
Resource aws_iam_role_policy_attachment created to attach the fis_iam_policy to IAM role
*/
resource "aws_iam_role_policy_attachment" "this" {

  role       = aws_iam_role.fis_network_role.name
  policy_arn = aws_iam_policy.fis_network_iam_policy.arn
}