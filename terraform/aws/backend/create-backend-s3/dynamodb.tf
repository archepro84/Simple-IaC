resource "aws_dynamodb_table" "create-backend-s3-dynamodb-table" {
  name         = "simple-iac-tfstate-lock"
  hash_key     = "LockID"
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S"
  }
}