##########################################################################
## Variables to create IAM role and policy for ssm document for az removal
### IAM
#########################################################################

variable "role_name" {
  description = "The name of the role"
  type        = string
}

variable "policy_name" {
  description = "The name of the policy"
  type        = string
}