data "aws_subnets" "observability" {
  filter {
    name   = "tag:Project"
    values = ["eks-stack"]
  }

  filter {
    name   = "tag:Purpose"
    values = ["observability"]
  }
}
