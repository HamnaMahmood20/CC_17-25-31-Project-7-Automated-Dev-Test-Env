## Git Branching Workflow

 HEAD
- `main` → stable IaC, ready for production-like environments
- `dev` → active development for Terraform modules and Ansible roles
- `feature/*` → short-lived branches for new tasks or experiments
- PRs: feature/* → dev → main

- main → stable IaC
- dev → active development
- feature/* → short-lived branches
- PRs: feature/* → dev → main

## Git Branching Workflow

main    (stable IaC for environments)
└── dev (active development of modules and roles)
    └── feature/* (short-lived)

PRs flow: feature/* → dev → main

 dev
