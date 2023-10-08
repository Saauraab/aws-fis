
resource "aws_cloudwatch_log_group" "fis_loggroup" {
  name = var.fis_loggroup_name
  retention_in_days = var.retention_in_days
}


