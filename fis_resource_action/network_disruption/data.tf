
data "aws_subnets" "public_subnets" {
  filter {
    name   = "tag:Name"
    values = [var.private_subnet_name]
  }
}

data "aws_instances" "test" {

  filter {
    name   = "subnet-id"
    values = data.aws_subnets.public_subnets.ids
  }
  instance_state_names = ["running"]
}

data "aws_instance" "instance_detail" {
  count = length(data.aws_instances.test.ids) 
  instance_id = data.aws_instances.test.ids[count.index] 
}

