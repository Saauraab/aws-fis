output "account_id" {
  value = data.aws_caller_identity.current.account_id
}



output "aurora_db_cluser_arn" {
 value = data.aws_rds_cluster.aurora_db_cluser_arn.arn
}

#output "fis_ec2_role" {
# value = data.aws_iam_role.fis_ec2_role.arn
#}

#output "fis_ec2_policy" {
# value = data.aws_iam_policy.fis_iam_policy.name
#}

