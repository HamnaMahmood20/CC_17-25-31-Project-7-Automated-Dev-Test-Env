## Git Branching Workflow

- `main` → stable IaC, ready for production-like environments
- `dev` → active development for Terraform modules and Ansible roles
- `feature/*` → short-lived branches for new tasks or experiments
- PRs: feature/* → dev → main

