######################################################################
## output.tf will output the necessary resources arn and id
######################################################################

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "aurora_db_cluster_arn" {
  value = data.aws_rds_cluster.aurora_db_cluser_detail.arn
}

output "aurora_db_cluser_instances_list" {
  value = data.aws_rds_cluster.aurora_db_cluser_detail.cluster_members
}

output "aws_db_instance_arns" {
  value = data.aws_db_instances.db_instance_arns.instance_arns
}

output "aws_subnet_arns" {
  value = data.aws_subnet.private_subnet.arn
}