resource "aws_dynamodb_table" "tbl_crawling_target_uris" {
  name         = local.DYNAMODB_TABLE_NAME
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "uri"
  range_key    = "post_id"

  attribute {
    name = "uri"
    type = "S"
  }
  attribute {
    name = "post_id"
    type = "S"
  }
}