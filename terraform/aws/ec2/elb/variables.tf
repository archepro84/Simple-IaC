locals {
  config            = yamldecode(file("./config.yml"))
  REGION            = local.config.REGION
  SERVICE_NAME      = local.config.SERVICE_NAME
  KEY_NAME          = local.config.KEY_NAME
  ROUTE53_URI       = local.config.ROUTE53_URI
  TARGET_GROUP_PORT = local.config.TARGET_GROUP_PORT
  SERVER_PORT       = local.config.SERVER_PORT

  ACCOUNT_ID = data.aws_caller_identity.current.account_id
}

# User 정보 호출
data "aws_caller_identity" "current" {}

variable "env" {
  description = "Depolyment environment"
  default     = "dev"
}