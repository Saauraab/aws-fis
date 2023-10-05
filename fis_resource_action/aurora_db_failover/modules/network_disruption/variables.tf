# Variables for providing to module fixture codes

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

/*
variable "private_subnet_name" {
  description = "Name of the public subnets of the VPC"
  type        = string
}
*/

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

variable "instance_action_name" {
  description = "ID of the the FIS ec2 action"
  type        = string
}

variable "instance_action_id" {
  description = "ID of the the FIS ec2 action"
  type        = string
}

variable "instance_target_key" {
  description = "ID of the the FIS ec2 action"
  type        = string
}

variable "instance_target_name" {
  description = "ID of the the FIS ec2 action"
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

variable "instance_resource_type" {
  description = "ID of the the FIS ec2 action"
  type        = string
}

variable "instance_selection_mode" {
  description = "ID of the the FIS ec2 action"
  type        = string
}

variable "instance_resource_arns" {
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