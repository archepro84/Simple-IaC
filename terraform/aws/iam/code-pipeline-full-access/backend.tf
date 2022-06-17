terraform {
  backend "s3" {
    bucket         = "simple-iac-tfstate"
    key            = "Simple-IaC/iam/code-pipeline-full-access/terraform.tfstate"
    region         = "ap-northeast-2"
    encrypt        = true
    dynamodb_table = "simple-iac-tfstate-lock"
  }
}