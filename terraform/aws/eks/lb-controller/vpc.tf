locals {
  vpc_cidr = "10.200.0.0/16"

  # ex: ap-northeast-2a, ap-northeast-2b
  azs = slice(data.aws_availability_zones.this.names, 0, 2)
}


# docs: https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.7.1"

  name = local.name
  cidr = local.vpc_cidr

  azs             = local.azs
  private_subnets = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 4, k)]
  public_subnets  = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 8, k + 48)]
  intra_subnets   = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 8, k + 52)]

  enable_nat_gateway = true
  single_nat_gateway = true

  # docs: https://docs.aws.amazon.com/eks/latest/userguide/alb-ingress.html
  public_subnet_tags = {
    "kubernetes.io/role/elb" = 1 # AWS Load Balancer Controller Enabled Tags
  }

  # docs: https://docs.aws.amazon.com/eks/latest/userguide/alb-ingress.html
  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = 1 # AWS Load Balancer Controller Enabled Tags
  }
}