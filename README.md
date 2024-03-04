<img alt="Terraform" src="https://www.datocms-assets.com/2885/1629941242-logo-terraform-main.svg" width="600px">

- Website: https://www.terraform.io
- Forums: [HashiCorp Discuss](https://discuss.hashicorp.com/c/terraform-core)
- Documentation: [https://www.terraform.io/docs/](https://www.terraform.io/docs/)


# Introduction 
This repository contains Terraform scripts to deploy and manage infrastructure on Microsoft Azure. Use this README file to get started, install prerequisites, and understand the best practices for using Terraform with Azure.


# Prerequisites
1.	**Terraform:** Install Terraform on your local machine. Follow the [official installation guide](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) for detailed instructions.

2.	**Azure CLI:** Install the Azure CLI to authenticate with Azure and manage resources. Refer to the [Azure CLI installation guide](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-windows?tabs=azure-cli) for instructions.


# Configuration
1.	**Azure Authentication:** Authenticate with Azure using the Azure CLI by running ``az login``.
2.	**Configuring permission:** Configure or validate permission using Azure CLI.
	1.	**To assign contrbuter role** az role assignment create --assignee <Application-Client-ID> --role Contributor --scope /subscriptions/<Subscription-ID>
	2.	**To list the roles** az role assignment list --assignee <Application-Client-ID> --scope /subscriptions/<Your-Subscription-ID>

3.	**Configuring environment variables:** Run cmd in admin mode & set environment variables, once you run with the commends below close the cmd or restart cmd. 

		setx ARM_SUBSCRIPTION_ID "subscription_id"
		setx ARM_TENANT_ID "tenant_id"
		setx ARM_CLIENT_ID "client_id"
		setx ARM_CLIENT_SECRET "client_secret"

:mag_right: Remember that changes to environment variables may not take effect in the current Command Prompt or PowerShell session, so it's a good practice to restart the session after setting them.

4.	**Terraform Configuration:** Create a **terraform.tfvars** file and reference the environment variables.

		subscription_id = var.ARM_SUBSCRIPTION_ID
		tenant_id       = var.ARM_TENANT_ID
		client_id       = var.ARM_CLIENT_ID
		client_secret   = var.ARM_CLIENT_SECRET


# Local Testing
1.	**Initialize Terraform:** Run ``terraform init`` to initialize the working directory with Azure provider.
2.	**Plan & Apply:** Run ``terraform plan`` to preview the changes and ``terraform apply`` to apply them.
3.	**Destroy Resources:** When done testing, run ``terraform destroy`` to destroy the created resources.

:bulb: It is best practice to destroy resources during testing phase

:warning: DO NOT RUN `terraform destroy` IN PRODUCTION ENVIRONMENT THIS WILL DESTROY EVERYTHING IN PRODUCTION.

