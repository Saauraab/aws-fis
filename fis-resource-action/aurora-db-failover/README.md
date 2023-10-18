AWS Fault Injection Simulator (FIS) is a fully managed service for running fault injection experiments to improve an application’s performance,
observability, and resiliency.

This repo will create the FIS experiment template for auroradb failover and network disruption.
Resources
  IAM Role - Role created to perform the necessary action on the resources
  IAM Policy
    - Created to update the Log group
    - Created to perform the failover on the aurordb cluster
    - Created to perform the network disruption 
  Log Group - It will store the FIS log events

AuroraDB Expirement Template will create the FIS resource(auroradb-experiment_template) to perform the db failover simulation
Network Disruption Experiment Template(network-experiment_template) will perform below two actions
  - It wil failover the aurordb cluster
  - It will block the network traffic for the subnet of auroradb cluster

Modules created for the reusability of the terraform scipts
  - modules/cloudwatch_log_group - Resource to create the fis-loggroup
  - modules/created_iam - IAM role and Policy can be provisioned using the modules
  - modules/fis_auroradb_failover - It will provision the experiment template only for the auroradb failover
  - modules/network_disruption - It will create the experiment template which will perform two actions (db-failover and disrupt network traffic)

Terraform script
  - main.tf : It will fetch the variables from the template.tfvars and invoke the resources defined in the modules 
  - template.tfvars : User will pass all the required variables to provision the experiment template
  - data.tf : It will fetch the attribute of the provisioned resources in AWS
  - output.tf : It will show the output of the provisioned resources
  
  
Commands to run the terraform script
terraform init
terraform plan -var-file="template.tfvars"
terraform apply -var-file="template.tfvars"
