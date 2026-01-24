# Environment Provisioning Procedures

To ensure that Dev, QA, and UAT environments do not conflict, we use Terraform Workspaces for state isolation.

### Commands to Request/Switch Environments

1. **Initialize Terraform:**
   `terraform init`

2. **List available environments:**
   `terraform workspace list`

3. **Switch to a specific environment (e.g., QA):**
   `terraform workspace select qa`

4. **Deploy the environment:**
   `terraform apply -var-file="environments/qa.tfvars"`

5. **Destroy the environment:**
   `terraform destroy -var-file="environments/qa.tfvars"`