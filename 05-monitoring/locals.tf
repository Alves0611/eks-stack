locals {
  eks_cluster_name = data.terraform_remote_state.cluster_stack.outputs.eks_cluster_name
}
