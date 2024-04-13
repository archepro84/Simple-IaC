terraform {
  required_version = ">= 1.5.0"

  # NOTE: Helm 및 Kubectl Provider는 EKS Module이 배포된 이후 Enable 되어야 합니다.
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.40"
    }
    # docs: https://registry.terraform.io/providers/hashicorp/helm/latest
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.7"
    }
    # docs: https://registry.terraform.io/providers/alekc/kubectl/latest
    kubectl = {
      source  = "alekc/kubectl"
      version = ">= 2.0"
    }
  }
}