region            = "eu-west-1"
impacted_az       = "eu-west-1b"
autoscaling_group = "test-ssm-asg"
assumeRole        = "arn:aws:iam::227622396901:role/fis-ssm-role"
duration          = "5"
role_name         = "fis-ssm-role"
policy_name       = "fis-ssm-policy"
name              = "fis-ssm-az-removal-document"