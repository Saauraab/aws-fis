# AWS Fault Injection Simulator

##############################################################################################
## IAM role created to performt the db failover operation on the aurora db instances instances##
##############################################################################################
resource "aws_iam_role" "fis_rds_role" {
  name = var.role_name
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

##############################################################################################
## IAM policy will have the required permission to reboot the db writer instance ##
##############################################################################################
resource "aws_iam_policy" "fis_rds_policy" {
  name = var.policy_name
  
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "rds:FailoverDBCluster"
            ],
            "Resource": var.rds_cluster_arn
        },
        {
            "Effect": "Allow",
            "Action": [
                "rds:RebootDBInstance"
            ],
            "Resource":  var.rds_instances_arn
        }
    ]
})
}



##############################################################################################
## IAM policy will have the required permission for the network disruption  ##
##############################################################################################
resource "aws_iam_policy" "fis_rds_network_policy" {
  name = var.network_policy_name
  
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

##############################################################################################
## IAM policy will have the required permission to write the cloudwatch log for fis-loggroup ##
##############################################################################################

resource "aws_iam_policy" "fis_cloudwatch_policy" {
  name = "fis-rds-cloudwatch-policy"
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogDelivery"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "logs:PutResourcePolicy",
                "logs:DescribeResourcePolicies",
                "logs:DescribeLogGroups"
            ],
            "Resource": "*"
        }
    ]
  })
}

##############################################################################################
## Resource aws_iam_role_policy_attachment created to attach the fis_iam_policy to IAM role ##
##############################################################################################

resource "aws_iam_role_policy_attachment" "this" {
   role       = aws_iam_role.fis_rds_role.name
   policy_arn = aws_iam_policy.fis_rds_network_policy.arn
}

resource "aws_iam_role_policy_attachment" "attach_mqtt_policy" {
  role       = aws_iam_role.fis_rds_role.name
  policy_arn = aws_iam_policy.fis_rds_policy.arn
}

resource "aws_iam_role_policy_attachment" "attach_cloudlog_policy" {
  role       = aws_iam_role.fis_rds_role.name
  policy_arn = aws_iam_policy.fis_cloudwatch_policy.arn
}
