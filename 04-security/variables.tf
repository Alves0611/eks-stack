variable "region" {
  type        = string
  description = "The region to deploy"
  default     = "us-east-1"
}

variable "waf" {
  type = object({
    name  = string
    scope = string
    custom_response_body = object({
      key          = string
      content      = string
      content_type = string
    })
    visibility_config = object({
      cloudwatch_metrics_enabled = bool
      metric_name                = string
      sampled_requests_enabled   = bool
    })
  })

  default = {
    name  = "waf-eks-stack-webacl"
    scope = "REGIONAL"
    custom_response_body = {
      key          = "403-CustomForbiddenResponse"
      content      = "You are not allowed to perform the action you requested."
      content_type = "APPLICATION_JSON"
    }
    visibility_config = {
      cloudwatch_metrics_enabled = true
      metric_name                = "waf-eks-stack-webacl-metrics"
      sampled_requests_enabled   = true
    }
  }
}

variable "tags" {
  type        = map(string)
  description = "The tags to apply"
  default = {
    ManagedBy = "Terraform"
    Project   = "eks-stack"
  }
}
