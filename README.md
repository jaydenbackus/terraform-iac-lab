# Terraform IaC Lab: AWS S3 Bucket

This repo deploys one private Amazon S3 bucket with Terraform, verifies it, and destroys it.

## Layout

| Path | Contents |
|------|----------|
| `terraform-lab/main.tf` | Provider, bucket, public-access block, and output |
| `reflection/REFLECTION.md` | Answers to the reflection questions |
| `screenshots/` | Console evidence after create and after destroy |

## Prerequisites

- Terraform 1.x
- AWS CLI with credentials configured (`aws sts get-caller-identity` should succeed)

No credentials, `.tfvars` files, or state files are committed; `.gitignore` excludes them.

## Workflow

```sh
cd terraform-lab
terraform init       # download the AWS provider
terraform fmt        # format the configuration
terraform validate   # check syntax and references
terraform plan       # preview: 2 to add
terraform apply      # create the bucket (type yes)
# verify in the S3 console, take a screenshot
terraform destroy    # remove the bucket (type yes)
```

S3 bucket names are global. If `jaydenbackus-iac-lab-652767` is taken, change the `bucket` value in `main.tf`.
