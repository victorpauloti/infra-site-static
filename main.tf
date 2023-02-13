terraform {
  required_version = "1.3.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.53.0"
    }
  }
}

provider "aws" {
  region  = var.region
  profile = var.profile
}

data "aws_canonical_user_id" "current" {}
data "aws_caller_identity" "current" {}


resource "aws_s3_bucket" "bucketstars" {
  bucket = var.bucket_name
  tags = var.tags

  website {
    index_document = "index.html"

  }
}

resource "aws_s3_bucket_acl" "acl_bucket" {
  bucket = aws_s3_bucket.bucketstars.id
  acl    = "public-read"
}