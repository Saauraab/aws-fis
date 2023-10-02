/*
data.tf will fetch the properties of the provisioned aws services 
*/

/*
aurora_db_cluser_arn will fetch the arn of the db cluster to perform the FIS acitivity
*/
data "aws_rds_cluster" "aurora_db_cluser_arn" {
  cluster_identifier= var.cluster_identifier
}