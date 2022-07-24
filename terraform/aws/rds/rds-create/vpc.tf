resource "aws_vpc" "rds-create-main" {
  cidr_block           = "10.1.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "${local.SERVICE_NAME}-create"
  }
}

resource "aws_internet_gateway" "rds-create-igw" {
  vpc_id = aws_vpc.rds-create-main.id

  tags = {
    Name = "${local.SERVICE_NAME}-create-igw"
  }
}