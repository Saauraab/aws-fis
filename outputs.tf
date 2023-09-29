output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "aws_subnets" {
  description = "ID of project VPC"
  value       = data.aws_subnets.public_subnets.ids
}


output "aws_instances" {
  description = "ID of project VPC"
  value       = data.aws_instances.test.ids
}

output "aws_instance_count" {
  description = "ID of project VPC"
  value       = length(data.aws_instances.test.ids)
}

output "instances_arn_list" {
 value = data.aws_instance.instance_detail[*].arn
}

