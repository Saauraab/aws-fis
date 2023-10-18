######################################################################
## Variables to create IAM role and policy for FIS experiment template
### IAM
######################################################################

variable "role_name" {
  description = "AWS role to perform FIS"
  type        = string
}

variable "policy_name" {
  description = "Ec2 simulator policy"
  type        = string
}


variable "subnet_instances_arn" {
  description = "Arn of the subnet instances"
  type        = list
}

variable "network_policy_name" {
  description = "The name of the network simulator policy"
  type        = string
}