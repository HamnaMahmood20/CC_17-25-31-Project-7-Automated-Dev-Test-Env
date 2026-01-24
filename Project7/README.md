## Git Branching Workflow

- main → stable IaC
- dev → active development
- feature/* → short-lived branches
- PRs: feature/* → dev → main

## Git Branching Workflow

main    (stable IaC for environments)
└── dev (active development of modules and roles)
    └── feature/* (short-lived)

PRs flow: feature/* → dev → main

