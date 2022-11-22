locals {
  ACCOUNT_ID = data.aws_caller_identity.current.account_id
}

# User 정보 호출
data "aws_caller_identity" "current" {}

variable "env" {
  description = "Depolyment environment"
  default     = "dev"
}

variable "service_name" {
  description = "Terraform Service Name"
}

variable "region" {
  description = "AWS Region"
}