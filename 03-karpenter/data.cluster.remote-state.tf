data "terraform_remote_state" "cluster_stack" {
  backend = "s3"

  config = {
    bucket         = "tfstate-444065722670"
    key            = "eks-stack/eks/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "state-locking-444065722670"
  }
}
