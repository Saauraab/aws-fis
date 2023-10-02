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

variable "template_name" {
  description = "Name of the experiment template"
  type        = string
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