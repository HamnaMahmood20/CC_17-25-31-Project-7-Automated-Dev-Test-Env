Project7 – Automated Development and Testing Environment

**Table of Contents**
Project Overview
Architecture Overview
Git Branching Workflow
Repository Structure
Environment Provisioning & Automation
Teardown and Cost Optimization
Usage
Challenges & Solutions
Conclusion
Project Overview

This project implements an automated development and testing environment using Terraform and Ansible. It allows developers and QA engineers to provision complete, isolated environments (dev, qa, uat) on-demand in AWS, with consistent configurations and ready-to-use web stacks (LAMP and Nginx+PHP-FPM).

*Key features include:
Reusable Terraform modules for network, security, and compute
Ansible roles to configure web servers and development tools
Automated provisioning and teardown via bash scripts
Environment health checks for validation
Architecture Overview
The infrastructure is designed for on-demand isolated environments:
VPC per environment with public and private subnets
Security Groups with least-privilege rules

EC2 Instances:

Apache web server (LAMP stack)

Nginx + PHP-FPM web server

Nginx proxy with autoindex for development convenience

Terraform handles provisioning

Ansible handles configuration management

Bash scripts automate provisioning, teardown, and health checks

For detailed diagrams and architecture, refer to docs/architecture.md.

**Git Branching Workflow**

The repository follows a structured branching strategy to ensure stable development and controlled integration:

main → Stable IaC, ready for production-like environments

dev → Active development for Terraform modules and Ansible roles

feature/* → Short-lived branches for new tasks or experiments

Pull Request (PR) Flow:
feature/* → dev → main

Summary:

main: stable IaC for environments

dev: active development

feature/*: short-lived branches

PRs flow from feature/* → dev → main

This workflow ensures that experimental changes do not affect stable environments while allowing collaborative development.

Repository Structure
Project7/
├── README.md
├── .gitignore
├── scripts/
│   ├── env-provision.sh
│   ├── env-destroy.sh
│   └── env-health-check.sh
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── backend.tf
│   ├── terraform.tfvars.example
│   ├── environments/
│   │   ├── dev.tfvars
│   │   ├── qa.tfvars
│   │   └── uat.tfvars
│   └── modules/
│       ├── network/
│       ├── security/
│       └── compute/
├── ansible/
│   ├── ansible.cfg
│   ├── inventory/
│   ├── playbooks/
│   └── roles/
└── docs/
