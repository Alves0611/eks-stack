variable "region" {
  type        = string
  description = "The region to deploy"
  default     = "us-east-1"
}

variable "tags" {
  type        = map(string)
  description = "The tags to apply"
  default = {
    ManagedBy = "Terraform"
    Project   = "eks-stack"
  }
}
