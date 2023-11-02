# AWS Fault Injection Simulator

##############################################################################################
## IAM role created to remove the subnet from asg for the particular duration#
resource "aws_iam_role" "ssm_policy" {
  name = var.role_name
  assume_role_policy = jsonencode({
    "Version" = "2012-10-17",
    "Statement" = [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "ssm.amazonaws.com"
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
## IAM policy will have the required permission to write the cloudwatch log for fis-loggroup ##
##############################################################################################

resource "aws_iam_policy" "fis_ssm_policy" {
  name = var.policy_name
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "EnableAsgDocument",
            "Effect": "Allow",
            "Action": [
                "autoscaling:DescribeAutoScalingGroups",
                "autoscaling:SuspendProcesses",
                "autoscaling:ResumeProcesses",
                "autoscaling:UpdateAutoScalingGroup",
                "ec2:DescribeInstances",
                "ec2:DescribeInstanceStatus",
                "ec2:TerminateInstance",
                "ec2:DescribeSubnets"
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
   role       = aws_iam_role.ssm_policy.name
   policy_arn = aws_iam_policy.fis_ssm_policy.arn
}