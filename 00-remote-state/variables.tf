variable "region" {
  type        = string
  description = "The region to deploy the S3 bucket"
  default     = "us-east-1"
}

variable "tags" {
  type        = map(string)
  description = "The tags to apply to the S3 bucket"
  default = {
    ManagedBy   = "Terraform"
    Project     = "eks-stack"
  }
}
