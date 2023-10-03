######################################################################
## Variables to create IAM role and policy for FIS experiment template
### IAM
######################################################################

variable "role_name" {
  description = "The aws region to deploy"
  type        = string
}

variable "policy_name" {
  description = "The name of the resource"
  type        = string
}

variable "rds_cluster_arn" {
  description = "The name of the resource"
  type        = string
}

variable "rds_instances_arn" {
  description = "The name of the resource"
  type        = list
}