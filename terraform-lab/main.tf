terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "student" {
  bucket = "jaydenbackus-iac-lab-652767"

  tags = {
    Project = "terraform-iac-lab"
  }
}

resource "aws_s3_bucket_public_access_block" "student" {
  bucket = aws_s3_bucket.student.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

output "bucket_name" {
  value = aws_s3_bucket.student.bucket
}
