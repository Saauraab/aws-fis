
###############################################################
### Variables created for the environment specific resources
################################################################
region = "eu-west-1"
role_name = "fis-ssm-role-test"
policy_name = "fis-ssm-policy-test"

##################################################################
### Variables created for the user input to run the ssm document
##################################################################
impacted_az = "eu-west-1b"
assumeRole        = "arn:aws:iam::227622396901:role/fis-ssm-role-test"
duration          = "5"
name              = "fis-ssm-az-removal-document-test"
autoscaling_group = "test-asg-grp"
