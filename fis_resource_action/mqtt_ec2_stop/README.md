This repository created to know more about the FIS.
This repo will have the terraform code to create the FIS (Fault Injector Simulator) experiment template
We will playaround with two scenarios
  Network Disruption 
  Stop EC2 instances in a particular subnet
  
  
Commands
terraform init
terraform plan -var-file="template.tfvars"
terraform apply -var-file="template.tfvars"
