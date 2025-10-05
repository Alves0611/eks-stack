data "aws_subnets" "privates" {
  filter {
    name   = "map-public-ip-on-launch"
    values = ["true"]
  }

  filter {
    name   = "tag:Project"
    values = ["eks-stack"]
  }
}