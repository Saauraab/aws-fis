#########################################################################################
## data.tf will fetch the properties of the provisioned aws services 
#########################################################################################

#########################################################################################
## aurora_db_cluser_arn will fetch the arn of the db cluster to perform the FIS acitivity
#########################################################################################
data "aws_rds_cluster" "aurora_db_cluser_detail" {
  cluster_identifier = var.cluster_identifier
}

#########################################################################################
## db_instance_arns will return the arn list of the db instances in a cluster
#########################################################################################
data "aws_db_instances" "db_instance_arns" {
  filter {
    name   = "db-cluster-id"
    values = [var.cluster_identifier]
  }
}


