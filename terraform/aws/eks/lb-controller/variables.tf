locals {
  name = "${var.env}-${replace(var.name, "_", "-")}"

  tags = {
    Project     = var.name
    Environment = var.env
    Terraform   = true
  }
}


variable "region" {
  description = "The region AWS resources will be created in"
  type        = string
}

variable "name" {
  description = "Project Name"
  type        = string
}

variable "env" {
  description = "Environment"
  type        = string
}
