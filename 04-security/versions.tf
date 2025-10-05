terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.8.0"
    }
  }
  backend "s3" {
    bucket         = "tfstate-444065722670"
    key            = "eks-stack/security/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "state-locking-444065722670"
  }
}
