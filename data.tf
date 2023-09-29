/*
data aws_subnets will return the subnet id 
*/
data "aws_subnets" "private_subnets" {
  filter {
    name   = "tag:Name"
    values = [var.private_subnet_name]
  }
}

/*
data aws_instances will fetch all the instances ids in a given subnet
*/
data "aws_instances" "instances_list" {

  filter {
    name   = "subnet-id"
    values = data.aws_subnets.private_subnets.ids
  }
  instance_state_names = ["running"]
}

/*
data ws_instance will return the instance detail
*/
data "aws_instance" "instance_detail" {
  count = length(data.aws_instances.instances_list.ids) 
  instance_id = data.aws_instances.instances_list.ids[count.index] 
}


