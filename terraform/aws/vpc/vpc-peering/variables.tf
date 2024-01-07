variable "project_name" {
  description = "Project name."
  type        = string
  default     = "vpc-peering"
}

variable "region" {
  description = "AWS Region to deploy to."
  type        = string
  default     = "ap-northeast-2"
}
