######################################################################
## Variables to create IAM role and policy for FIS experiment template
### IAM
######################################################################

variable "role_name" {
  description = "The name of the role"
  type        = string
}

variable "policy_name" {
  description = "The name of the policy"
  type        = string
}

variable "rds_cluster_arn" {
  description = "The arn of the rds cluster"
  type        = string
}

variable "rds_instances_arn" {
  description = "The arn of the resource"
  type        = list
}

variable "network_policy_name" {
  description = "The name of the network simulator policy"
  type        = string
}