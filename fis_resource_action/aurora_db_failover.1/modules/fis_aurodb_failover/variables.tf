############################################################
## Variables to create the auroradb FIS experiment template
############################################################

### network
variable "aws_region" {
  description = "The aws region to deploy"
  type        = string
  default     = "us-east-1"
}

variable "name" {
  description = "The name of the resource"
  type        = string
  default     = "us-east-1"
}

variable "action_name" {
  description = "Name of the action to be perfomed"
  type        = string
}


variable "target_name" {
  description = "Name of the target resource for FIS"
  type        = string
}

variable "resource_type" {
  description = "aws resource for the FIS"
  type        = string
}

variable "action_id" {
  description = "ID of the the FIS ec2 action"
  type        = string
}


variable "cluster_identifier" {
  description = "Name of the rds cluster on which the FIS will be performed"
  type        = string
}

variable "target_key" {
  description = "Key for the target rds cluster on which the FIS will be performed"
  type        = string
}

variable "selection_mode" {
  description = "Name of the selection mode on which the FIS will be performed"
  type        = string
}

variable "iam_role_arn" {
  description = "ARN of the IAM role"
  type        = string
}

variable "resource_arns" {
  description = "Arns of the aurorodb instances"
  type        = list
}