terraform {
  backend "s3" {
    bucket         = "simple-iac-tfstate"
    key            = "Simple-IaC/code-pipeline/code-build/terraform.tfstate"
    region         = "ap-northeast-2"
    encrypt        = true
    dynamodb_table = "simple-iac-tfstate-lock"
  }
}