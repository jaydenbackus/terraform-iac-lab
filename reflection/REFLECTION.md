# Reflection

**1. Which cloud provider did you choose, and why?**

AWS. I already had an AWS account, and the AWS CLI was installed and signed in, so Terraform could authenticate without extra setup. S3 is also one of the most widely used cloud services, which makes it a useful first resource to learn.

**2. What resource did you create?**

A private Amazon S3 bucket, `jaydenbackus-iac-lab-652767`, in `us-west-2`, with a public-access block that rejects public ACLs and bucket policies.

**3. What does the provider block do in Terraform?**

It configures the plugin Terraform uses to talk to a cloud's API. Here it selects the AWS provider and sets the region to `us-west-2`. Credentials come from the AWS CLI configuration, not from the code.

**4. What is the purpose of the resource block?**

It declares a piece of infrastructure and its desired settings. Terraform compares that declaration with its state and the real cloud, then creates, changes, or deletes resources to match.

**5. Why should you review `terraform plan` before running `terraform apply`?**

The plan shows exactly what Terraform will add, change, or destroy. Reading it first catches mistakes, such as a wrong name, region, or an unintended deletion, before they touch real infrastructure or cost money.

**6. What happened when you ran `terraform destroy`?**

Terraform planned 2 to destroy. It removed the public-access block first, then the bucket, and reported "Destroy complete! Resources: 2 destroyed." The S3 console then showed "General purpose buckets (0)" (see `screenshots/03-destroyed-bucket-list.jpg`).

**7. What error or challenge did you encounter, if any, and how did you troubleshoot it?**

The deployment itself ran without errors, but two points needed attention:

- **Globally unique bucket names.** S3 bucket names are shared across every AWS account, so a generic name could collide with someone else's. I added my username and six random digits (`jaydenbackus-iac-lab-652767`), and `terraform plan` and `apply` succeeded on the first try.
- **Which identity Terraform used.** Running `aws sts get-caller-identity` showed I was signed in as the account's root user. Terraform works with those credentials, but AWS recommends against using root for daily work. The better practice is an IAM user or IAM Identity Center role with only the permissions the task needs.

**8. What is one benefit of using Infrastructure as Code instead of manually creating cloud resources?**

The configuration is repeatable and reviewable. The same file creates the same resource every time, lives in version control, and can be destroyed cleanly, so nothing is left running by accident.
