output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "aws_subnets" {
  description = "It will return the subnet_id"
  value       = data.aws_subnets.private_subnets.ids
}


output "aws_instances" {
  description = "It will return the list of instances in a subnet"
  value       = data.aws_instances.instances_list.ids
}

output "aws_instance_count" {
  description = "It will return the instance count"
  value       = length(data.aws_instances.instances_list.ids)
}

output "instances_arn_list" {
 description = "It will return the arn of the instances"
 value = data.aws_instance.instance_detail[*].arn
}

