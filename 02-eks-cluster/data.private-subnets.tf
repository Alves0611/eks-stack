data "aws_subnets" "privates" {
  filter {
    name   = "map-public-ip-on-launch"
    values = ["false"]
  }

  filter {
    name   = "tag:Project"
    values = ["eks-stack"]
  }
}