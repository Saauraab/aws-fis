#########################################################################################
## fis_role_arn will return the arn of IAM role
#########################################################################################
output "fis_loggroup_arn" {
    value = aws_cloudwatch_log_group.fis_loggroup.arn
}