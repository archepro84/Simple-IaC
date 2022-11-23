terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "simple-iac"

    workspaces {
      name = "code-commit"
    }
  }
}

provider "aws" {
  region = var.region
}