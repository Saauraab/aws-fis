# AWS Fault Injection Simulator

##############################################################################################
## IAM role created to performt the db failover operation on the aurora db instances instances##
##############################################################################################
resource "aws_iam_role" "fis_mqtt_iam_role" {
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
resource "aws_iam_policy" "fis_mqtt_iam_policy" {
  name = var.policy_name
  
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
             Resource = var.subnet_instances_arn
        }
    ]
})
}

resource "aws_iam_policy" "fis_mqtt_cloudwatch_policy" {
  name = "fis_cloudwatch_policy"
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
            "Resource": var.subnet_instances_arn
        }
    ]
  })
}

##############################################################################################
## Resource aws_iam_role_policy_attachment created to attach the fis_iam_policy to IAM role ##
##############################################################################################
/*resource "aws_iam_role_policy_attachment" "this" {
   role       = aws_iam_role.fis_mqtt_iam_role.name
   for_each = toset([
    aws_iam_policy.fis_mqtt_iam_policy.arn, 
    aws_iam_policy.fis_mqtt_cloudwatch_policy.arn
  ])
  policy_arn = each.value
}
*/

resource "aws_iam_role_policy_attachment" "attach_policy1" {
  role       = aws_iam_role.fis_mqtt_iam_role.name
  policy_arn = aws_iam_policy.fis_mqtt_iam_policy.arn
}

resource "aws_iam_role_policy_attachment" "attach_policy2" {
  role       = aws_iam_role.fis_mqtt_iam_role.name
  policy_arn = aws_iam_policy.fis_mqtt_cloudwatch_policy.arn
}