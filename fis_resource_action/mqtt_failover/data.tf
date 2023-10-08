#########################################################################################
## data.tf will fetch the properties of the provisioned aws services 
#########################################################################################

data "aws_caller_identity" "current" {}

#########################################################################################
## subnet_arns will return the arn list of the db instances in a cluster
#########################################################################################
data "aws_subnet" "private_subnet" {
  id = var.private_subnet_id
}

#########################################################################################
## fis_role_arn will return the arn of AWS FIS IAM Role
#########################################################################################
data "aws_iam_role" "fis_role_arn" {
  name = "AWSServiceRoleForFIS"
}

data "aws_subnets" "private_subnets" {
  filter {
    name   = "tag:Name"
    values = [var.private_subnet_name]
  }
}

###############################################################################
## data aws_instances will fetch all the instances ids in a given subnet##
###############################################################################
data "aws_instances" "instances_list" {

  filter {
    name   = "subnet-id"
    values = data.aws_subnets.private_subnets.ids
  }
  instance_state_names = ["running"]
}

###############################################################################
## data ws_instance will return the instance detail
###############################################################################
data "aws_instance" "instance_detail" {
  count       = length(data.aws_instances.instances_list.ids)
  instance_id = data.aws_instances.instances_list.ids[count.index]
}



