SHELL := /usr/bin/env bash

# HOW TO EXECUTE
# Executing Terraform PLAN
#     $ make tf-plan env=internal
# Executing Terraform APPLY
#     $ make tf-apply env=dev
# Executing Terraform DESTROY
#     $ make tf-destroy env=dev

# Available environments: internal / staging / prod

.PHONY: help clean tf-plan tf-apply tf-destroy all-test

.DEFAULT_GOAL := help

help:
	@echo "Usage:"
	@echo "  make <target> env=<environment>"
	@echo ""
	@echo "Targets:"
	@echo "  tf-plan     Execute Terraform plan"
	@echo "  tf-apply    Execute Terraform apply"
	@echo "  tf-destroy  Execute Terraform destroy"
	@echo "  clean       Clean up the Terraform state files"
	@echo "  all-test    Clean and then run Terraform plan"
	@echo ""
	@echo "Environments:"
	@echo "  Internal    Development/QA"
	@echo "  Staging        Staging"
	@echo "  prod        Production"

check-env:
ifndef env
	$(error env is not set)
endif

clean: check-env
	rm -rf .terraform

tf-plan: check-env clean
	terraform fmt && terraform init -backend-config=environments/$(env)/backend.tf -reconfigure && terraform validate && terraform plan -var-file=environments/$(env)/terraform.tfvars

tf-apply: check-env clean
	terraform fmt && terraform init -backend-config=environments/$(env)/backend.tf -reconfigure && terraform validate && terraform apply -var-file=environments/$(env)/terraform.tfvars -auto-approve

tf-destroy: check-env
	terraform init -backend-config=environments/$(env)/backend.tf -reconfigure && terraform destroy -var-file=environments/$(env)/terraform.tfvars

all-test: clean tf-plan
