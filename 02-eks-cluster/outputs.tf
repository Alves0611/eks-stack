output "eks_cluster_name" {
  description = "Name of the EKS cluster"
  value       = aws_eks_cluster.this.name
}

output "eks_cluster_security_group" {
  description = "Security group of the EKS cluster"
  value       = aws_eks_cluster.this.vpc_config[0].cluster_security_group_id
}

output "kubernetes_oidc_provider_arn" {
  description = "ARN of the Kubernetes OIDC provider for EKS cluster"
  value       = aws_iam_openid_connect_provider.kubernetes.arn
}

output "kubernetes_oidc_provider_url" {
  description = "URL of the Kubernetes OIDC provider for EKS cluster"
  value       = aws_eks_cluster.this.identity[0].oidc[0].issuer
}

output "karpenter_node_role_name" {
  description = "Name of the IAM role used by Karpenter for node provisioning"
  value       = aws_iam_role.eks_cluster_node_group.name
}
