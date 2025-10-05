resource "helm_release" "load_balancer_controller" {
  name       = "aws-load-balancer-controller"
  repository = "https://aws.github.io/eks-charts"
  chart      = "aws-load-balancer-controller"
  version    = "1.13.0"
  namespace  = "kube-system"

  set = [
    {
      name  = "clusterName"
      value = aws_eks_cluster.this.name
    },
    {
      name  = "serviceAccount.create"
      value = true
    },
    {
      name = "region"
      value = var.region
    },
     {
      name  = "vpcId"
      value = data.aws_vpc.this.id
    },
    {
      name  = "serviceAccount.name"
      value = "aws-load-balancer-controller"
    },
    {
      name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
      value = aws_iam_role.load_balancer_controller.arn
    }
  ]

  depends_on = [
    aws_iam_role_policy_attachment.load_balancer_controller
  ]
}
