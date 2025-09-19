variable "region" {
  type        = string
  description = "The region to deploy the S3 bucket"
  default     = "us-east-1"
}

variable "vpc_resources" {
  type = object({
    cidr_block = string
    name       = string
    internet_gateway = string
  })
  default = {
    cidr_block = "10.0.0.0/24"
    name       = "eks-vpc"
    internet_gateway = "igw"
  }
}

variable "tags" {
  type        = map(string)
  description = "The tags to apply to the S3 bucket"
  default = {
    ManagedBy = "Terraform"
    Project   = "eks-stack"
  }
}
