variable "region" {
  type        = string
  description = "The region to deploy the S3 bucket"
  default     = "us-east-1"
}

variable "eks_cluster" {
  type = object({
    name                      = string
    role_name                 = string
    version                   = string
    enabled_cluster_log_types = list(string)

    access_config = object({
      authentication_mode = string
    })
  })
  default = {
    name                      = "studying-cluster"
    role_name                 = "studying-cluster-role"
    version                   = "1.33"
    enabled_cluster_log_types = ["audit", "api", "authenticator", "controllerManager", "scheduler"]
    access_config = {
      authentication_mode = "API_AND_CONFIG_MAP"
    }
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
