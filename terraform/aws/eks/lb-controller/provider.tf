data "aws_availability_zones" "this" {}

provider "aws" {
  region = var.region

  default_tags {
    tags = merge(local.tags)
  }
}

# NOTE: Helm 및 Kubectl Provider는 EKS Module이 배포된 이후 Enable 되어야 합니다.
# docs: https://registry.terraform.io/providers/hashicorp/helm/latest
#provider "helm" {
#  kubernetes {
#    host                   = module.eks.cluster_endpoint
#    cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
#
#    exec {
#      api_version = "client.authentication.k8s.io/v1beta1"
#      command     = "aws"
#      # This requires the awscli to be installed locally where Terraform is executed
#      args        = ["eks", "get-token", "--cluster-name", module.eks.cluster_name]
#    }
#  }
#}
#
#provider "kubectl" {
#  apply_retry_count      = 5
#  host                   = module.eks.cluster_endpoint
#  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
#  load_config_file       = false
#
#  exec {
#    api_version = "client.authentication.k8s.io/v1beta1"
#    command     = "aws"
#    # This requires the awscli to be installed locally where Terraform is executed
#    args        = ["eks", "get-token", "--cluster-name", module.eks.cluster_name]
#  }
#}