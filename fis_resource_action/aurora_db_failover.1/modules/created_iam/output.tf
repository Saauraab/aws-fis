#########################################################################################
## fis_role_arn will return the arn of IAM role
#########################################################################################
output "fis_iamrole_arn" {
    value = aws_iam_role.fis_rds_role.arn
}


#########################################################################################
## fis_role_policy will return the arn of IAM Policy role
#########################################################################################
output "fis_iampolicy_name" {
    value = aws_iam_policy.fis_rds_policy.name
}
