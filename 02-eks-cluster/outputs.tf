output "eks_cluster_name" {
  value = aws_eks_cluster.this.name
}

output "kubernetes_oidc_provider_arn" {
  value = aws_iam_openid_connect_provider.kubernetes.arn
}

output "kubernetes_oidc_provider_url" {
  value = aws_eks_cluster.this.identity[0].oidc[0].issuer
}

output "karpenter_node_role_name" {
  value = aws_iam_role.eks_cluster_node_group.name
}
