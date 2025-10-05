resource "aws_wafv2_web_acl" "this" {
  name  = var.waf.name
  scope = var.waf.scope

  default_action {
    allow {}
  }

  rule {
    name     = "98-SuspiciousRequestFlagger"
    priority = 98

    rule_label {
      name = "eks:suspicious:request"
    }

    action {
      count {}
    }

    statement {
      label_match_statement {
        scope = "NAMESPACE"
        key   = "awswaf:managed:aws:"
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "98-SuspiciousRequestFlaggerMetrics"
      sampled_requests_enabled   = true
    }
  }

  rule {
    name     = "99-CustomForbiddenResponse"
    priority = 99

    action {
      block {
        custom_response {
          response_code            = 403
          custom_response_body_key = "403-CustomForbiddenResponse"
        }
      }
    }

    statement {
      label_match_statement {
        scope = "LABEL"
        key   = "eks:suspicious:request"
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "99-CustomForbiddenResponseMetrics"
      sampled_requests_enabled   = true
    }
  }

  custom_response_body {
    key          = var.waf.custom_response_body.key
    content      = jsonencode({ message = var.waf.custom_response_body.content })
    content_type = var.waf.custom_response_body.content_type
  }

  visibility_config {
    cloudwatch_metrics_enabled = var.waf.visibility_config.cloudwatch_metrics_enabled
    metric_name                = var.waf.visibility_config.metric_name
    sampled_requests_enabled   = var.waf.visibility_config.sampled_requests_enabled
  }
}
