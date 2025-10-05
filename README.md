# 🚀 EKS Stack - Production-Ready Kubernetes Infrastructure

[![Terraform](https://img.shields.io/badge/Terraform-IAC-623CE4.svg?logo=terraform&logoColor=white)](https://terraform.io)
[![AWS](https://img.shields.io/badge/AWS-Cloud-FF9900.svg?logo=amazon-aws&logoColor=white)](https://aws.amazon.com)
[![Kubernetes](https://img.shields.io/badge/Kubernetes-1.28+-326CE5.svg?logo=kubernetes&logoColor=white)](https://kubernetes.io)
[![Karpenter](https://img.shields.io/badge/Karpenter-Auto--Scaling-FF6B35.svg?logo=kubernetes&logoColor=white)](https://karpenter.sh)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

> **A comprehensive, production-ready EKS infrastructure stack built with Terraform, featuring advanced networking, auto-scaling, security, and observability capabilities.**

## 📋 Table of Contents

- [🎯 Overview](#-overview)
- [🏗️ Architecture](#️-architecture)
- [✨ Features](#-features)
- [🚀 Quick Start](#-quick-start)
- [📁 Project Structure](#-project-structure)
- [🔧 Configuration](#-configuration)
- [📊 Monitoring & Observability](#-monitoring--observability)
- [🔒 Security](#-security)
- [📈 Auto-scaling](#-auto-scaling)
- [🌐 Networking](#-networking)
- [📝 Usage Examples](#-usage-examples)
- [🤝 Contributing](#-contributing)
- [📄 License](#-license)

## 🎯 Overview

This EKS Stack provides a complete, production-ready Kubernetes infrastructure on AWS with enterprise-grade features including:

- **High Availability**: Multi-AZ deployment with fault tolerance
- **Auto-scaling**: Karpenter for intelligent node provisioning
- **Security**: WAF, IAM roles, and network isolation
- **Observability**: Prometheus, Grafana, and comprehensive monitoring
- **Networking**: VPC with public/private subnets and observability subnets
- **Load Balancing**: Application Load Balancer with external DNS

## 🏗️ Architecture

![EKS Stack Architecture](images/eks-stack.drawio.svg)

### Infrastructure Components

| Component | Description | Technology |
|-----------|-------------|------------|
| **Networking** | VPC with multi-AZ subnets | AWS VPC, Route Tables, NAT Gateway |
| **Kubernetes** | Managed EKS cluster | AWS EKS 1.28+ |
| **Auto-scaling** | Intelligent node provisioning | Karpenter |
| **Load Balancing** | Application load balancer | AWS ALB, External DNS |
| **Security** | Web Application Firewall | AWS WAF |
| **Monitoring** | Metrics and dashboards | Prometheus, Grafana |
| **Storage** | Persistent volumes | AWS EBS CSI Driver |

## ✨ Features

### 🔧 Core Infrastructure
- ✅ **Multi-AZ EKS Cluster** with high availability
- ✅ **Managed Node Groups** with auto-scaling
- ✅ **Karpenter Integration** for cost-optimized scaling
- ✅ **VPC Networking** with public/private/observability subnets
- ✅ **Application Load Balancer** with external DNS
- ✅ **Certificate Manager** for SSL/TLS termination

### 🔒 Security & Compliance
- ✅ **IAM Roles** with least privilege access
- ✅ **Security Groups** with restrictive rules
- ✅ **WAF Protection** for web applications
- ✅ **Network Isolation** between tiers
- ✅ **Encryption** at rest and in transit

### 📊 Monitoring & Observability
- ✅ **Prometheus** for metrics collection
- ✅ **Grafana** for visualization and dashboards
- ✅ **Node Exporter** for system metrics
- ✅ **Custom Scraping** configuration
- ✅ **CloudWatch Integration**

### 🚀 DevOps & Automation
- ✅ **Terraform** infrastructure as code
- ✅ **Remote State** management with S3
- ✅ **State Locking** with DynamoDB
- ✅ **Modular Design** for reusability
- ✅ **Sample Deployments** included

## 🚀 Quick Start

### Prerequisites

- [Terraform](https://terraform.io/downloads.html) >= 1.0
- [AWS CLI](https://aws.amazon.com/cli/) configured
- [kubectl](https://kubernetes.io/docs/tasks/tools/) >= 1.28
- [helm](https://helm.sh/docs/intro/install/) >= 3.0

### 1. Clone the Repository

```bash
git clone https://github.com/Alves0611/eks-stack.git
cd eks-stack
```

### 2. Configure AWS Credentials

```bash
aws configure
# or
export AWS_ACCESS_KEY_ID="your-access-key"
export AWS_SECRET_ACCESS_KEY="your-secret-key"
export AWS_DEFAULT_REGION="us-east-1"
```

### 3. Deploy Infrastructure

```bash
# Deploy remote state backend
cd 00-remote-state
terraform init
terraform plan
terraform apply

# Deploy networking
cd ../01-networking
terraform init
terraform plan
terraform apply

# Deploy EKS cluster
cd ../02-eks-cluster
terraform init
terraform plan
terraform apply

# Deploy Karpenter
cd ../03-karpenter
terraform init
terraform plan
terraform apply

# Deploy monitoring
cd ../05-monitoring
terraform init
terraform plan
terraform apply
```

### 4. Configure kubectl

```bash
aws eks update-kubeconfig --region us-east-1 --name your-cluster-name
```

## 📁 Project Structure

```
eks-stack/
├── 00-remote-state/          # Terraform remote state backend
│   ├── s3.tf                 # S3 bucket for state storage
│   ├── dynamodb.tf           # DynamoDB for state locking
│   └── variables.tf          # Backend configuration
├── 01-networking/            # VPC and networking infrastructure
│   ├── vpc.tf                # VPC configuration
│   ├── vpc.public-subnets.tf # Public subnets
│   ├── vpc.private-subnets.tf# Private subnets
│   ├── vpc.observability-subnets.tf # Observability subnets
│   └── vpc.nat-gateways.tf   # NAT gateways
├── 02-eks-cluster/           # EKS cluster and add-ons
│   ├── eks.cluster.tf        # EKS cluster configuration
│   ├── eks.cluster.node-group.tf # Managed node groups
│   ├── eks.cluster.addons.*.tf # EKS add-ons
│   └── samples/              # Sample deployments
├── 03-karpenter/             # Karpenter auto-scaling
│   ├── karpenter.iam.tf      # IAM roles and policies
│   ├── karpenter.release.tf  # Helm chart deployment
│   └── resources/            # Karpenter configurations
├── 04-security/              # Security components
│   └── waf.alb.acl.tf        # WAF configuration
├── 05-monitoring/            # Monitoring and observability
│   ├── prometheus.workspace.tf # Prometheus workspace
│   ├── grafana.workspace.tf  # Grafana workspace
│   └── prometheus/           # Scraping configurations
└── images/                   # Architecture diagrams
    └── eks-stack.drawio.svg  # System architecture
```

## 🔧 Configuration

### Environment Variables

```bash
export AWS_REGION="us-east-1"
export CLUSTER_NAME="my-eks-cluster"
export VPC_CIDR="10.0.0.0/24"
```

### Key Configuration Files

- **`variables.tf`**: Main configuration variables
- **`locals.tf`**: Local values and computed variables
- **`outputs.tf`**: Resource outputs for other modules

## 📊 Monitoring & Observability

### Prometheus Configuration

The stack includes a fully configured Prometheus workspace with:

- **Metrics Collection**: Node, pod, and application metrics
- **Scraping Rules**: Pre-configured for common workloads
- **Retention**: Configurable data retention policies
- **Alerting**: Integration with CloudWatch alarms

### Grafana Dashboards

Access Grafana through the AWS console or direct URL:

- **Kubernetes Overview**: Cluster and node metrics
- **Application Metrics**: Custom application dashboards
- **Infrastructure**: AWS resource utilization
- **Security**: Security events and compliance

## 🔒 Security

### Network Security

- **VPC Isolation**: Private subnets for workloads
- **Security Groups**: Restrictive ingress/egress rules
- **NAT Gateway**: Outbound internet access for private subnets
- **WAF Protection**: Web application firewall rules

### Access Control

- **IAM Roles**: Service-specific roles with least privilege
- **RBAC**: Kubernetes role-based access control
- **Pod Security**: Security contexts and policies
- **Network Policies**: Kubernetes network segmentation

## 📈 Auto-scaling

### Karpenter Configuration

Karpenter provides intelligent node provisioning:

```yaml
# Example node pool configuration
apiVersion: karpenter.sh/v1beta1
kind: NodePool
metadata:
  name: default
spec:
  template:
    spec:
      nodeClassRef:
        apiVersion: karpenter.k8s.aws/v1beta1
        kind: EC2NodeClass
        name: default
      requirements:
        - key: karpenter.sh/capacity-type
          operator: In
          values: ["spot", "on-demand"]
```

## 🌐 Networking

### Subnet Configuration

- **Public Subnets**: Internet-facing resources (ALB, NAT)
- **Private Subnets**: Application workloads
- **Observability Subnets**: Monitoring and logging services

### DNS and Load Balancing

- **External DNS**: Automatic DNS record management
- **Application Load Balancer**: Layer 7 load balancing
- **Certificate Manager**: Automatic SSL/TLS certificates


