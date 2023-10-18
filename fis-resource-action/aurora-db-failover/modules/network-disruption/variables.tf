# Variables for providing to module fixture codes

########################################################################
### Variable required to deny the network traffic on a specific subnet
########################################################################

variable "subnet_action_name" {
  description = "Name of the experiment template"
  type        = string
}

variable "subnet_action_id" {
  description = "Name of the action to be perfomed"
  type        = string
}


variable "subnet_target_key" {
  description = "Name of the target resource for FIS"
  type        = string
}

variable "subnet_resource_type" {
  description = "ID of the the FIS ec2 action"
  type        = string
}

variable "subnet_resource_arns" {
  description = "ID of the the FIS ec2 action"
  type        = string
}

variable "subnet_selection_mode" {
  description = "ID of the the FIS ec2 action"
  type        = string
}

variable "duration" {
  description = "The name of the resource"
  type        = string
}

variable "scope" {
  description = "The name of the resource"
  type        = string
}

variable "subnet_target_name" {
  description = "The name of the resource"
  type        = string
}

########################################################################
### Variable required to perform the aurora db failover
########################################################################

variable "instance_action_name" {
  description = "Name of the action to be performed for the aurora db failover"
  type        = string
}

variable "instance_action_id" {
  description = "Id of the action for the auroradb failover"
  type        = string
}

variable "instance_target_key" {
  description = "target key for the auroradb failover"
  type        = string
}

variable "instance_target_name" {
  description = "target name for the auroradb failover"
  type        = string
}

variable "instance_resource_type" {
  description = "instance resource type for the auroradb failover"
  type        = string
}

variable "instance_selection_mode" {
  description = "selection mode of the action"
  type        = string
}

variable "instance_resource_arns" {
  description = "Return the db instances role arn"
  type        = string
}

## Variables required to fetch the fis role and loggroup arn

variable "fis_role_arn" {
  description = "Return the fis role arn"
  type        = string
}

variable "fis_log_group_arn" {
  description = "Return the cloudwatch log group role arn"
  type        = string
}

