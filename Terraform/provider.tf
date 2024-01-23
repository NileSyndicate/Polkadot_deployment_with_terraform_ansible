# Initialize terraform to deploy AWS Cloud resources
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Set the AWS region to Frankfurt eu-central-1
provider "aws" {
  region = "eu-central-1"
}

