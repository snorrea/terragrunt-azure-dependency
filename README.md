# Terragrunt on Azure with dependencies

In which we see if we can get module dependencies to behave how we want them to.

While there are numerous cosmetic improvements to be done, the primary concern is getting both modules deployed correctly.

In the target setup, there are two subscriptions: one for production only, and the other for everything else.

## Getting started

There are two files that need modification to run. See folder structure below for the location of the files.

* `global.hcl`: Tags and parameters common across all resources.
* `./environment/common.hcl`: Backend configuration for all environments.

See also the resource names. 

## Folder structure

```
├── README.md
├── global.hcl
├── modules/
│   ├── resource_group/
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   └── storage_account/
│       ├── main.tf
│       └── variables.tf
└── environments/
    ├── common.hcl                      => Backend configuration for dev/test and prod, separately 
    ├── dev/
    │   ├── terragrunt.hcl
    │   ├── resource_group/
    │   │   └── terragrunt.hcl
    │   ├── storage_account/
    │   │   └── terragrunt.hcl
    └── prod/
        ├── terragrunt.hcl
        ├── resource_group/
        │   └── terragrunt.hcl
        └── storage_account/
           └── terragrunt.hcl
```

