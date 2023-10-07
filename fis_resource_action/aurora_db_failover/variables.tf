###################################################################
## Variables to create auroradb FIS experiment template
###################################################################

variable "aws_region" {
  description = "The aws region to deploy"
  type        = string
  default     = "us-east-1"
}

variable "name" {
  description = "The name of the resource"
  type        = string
}


variable "cluster_identifier" {
  description = "Name of the rds cluster on which the FIS will be performed"
  type        = string
}

variable "private_subnet_id" {
  description = "The name of the resource"
  type        = string
}

################################################################################
## Variables to create IAM role and policy for AuroraDB FIS experiment template
################################################################################

variable "role_name" {
  description = "The role name for auroradb"
  type        = string
}

variable "policy_name" {
  description = "The policy of the aurora db failover"
  type        = string
}

################################################################################
## Variables to create auroradb failover for AuroraDB FIS experiment template
################################################################################

variable "action_name" {
  description = "Name of the action to be perfomed"
  type        = string
}


variable "target_name" {
  description = "Name of the target resource for FIS"
  type        = string
}

variable "resource_type" {
  description = "aws resource type for the FIS"
  type        = string
}

variable "action_id" {
  description = "ID of the the FIS action"
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

################################################################################
## Variables to create FIS experiment template to disrupt the network traffic
################################################################################
variable "subnet_action_name" {
  description = "The name of the action"
  type        = string
}
variable "subnet_action_id" {
  description = "ID of the action."
  type        = string
}

variable "subnet_target_key" {
  description = "The target key for the subnet"
  type        = string
}

variable "subnet_resource_type" {
  description = "The resource type of subnet"
  type        = string
}

variable "subnet_selection_mode" {
  description = "The selection mode of the subnet"
  type        = string
}

variable "subnet_target_name" {
  description = "The subnet target name"
  type        = string
}

variable "duration" {
  description = "The duration required for the network outage on subnet"
  type        = string
}

variable "scope" {
  description = "The scope of the network outage"
  type        = string
}

################################################################################
## Variables to create FIS experiment template for failover
################################################################################

variable "instance_action_name" {
  description = "The name of the action"
  type        = string
}

variable "instance_action_id" {
  description = "The name of the actionid"
  type        = string
}

variable "instance_target_key" {
  description = "The name of the target key"
  type        = string
}

variable "instance_target_name" {
  description = "The name of the instance target name"
  type        = string
}

variable "instance_resource_type" {
  description = "The name of the instance resource type"
  type        = string
}

variable "instance_selection_mode" {
  description = "The selection mode for the instances"
  type        = string
}




###################################################################
## Variables to create auroradb FIS experiment template
###################################################################


variable "fis_loggroup_name" {
  description = "The name of the cloudwatch fis_loggroup_name"
  type        = string
}

variable "retention_in_days" {
  description = "Retention period of the cloud watch"
  type        = number
}



