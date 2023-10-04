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
## Resource aws_iam_role_policy_attachment created to attach the fis_iam_policy to IAM role ##
##############################################################################################
resource "aws_iam_role_policy_attachment" "this" {
  role       = aws_iam_role.fis_rds_role.name
  policy_arn = aws_iam_policy.fis_rds_policy.arn
}