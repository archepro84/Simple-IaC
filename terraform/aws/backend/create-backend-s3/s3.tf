resource "aws_s3_bucket" "create-backend-s3-s3-bucket"{
  bucket = "simple-iac-tfstate"

  versioning {
    enabled = true
  }
}