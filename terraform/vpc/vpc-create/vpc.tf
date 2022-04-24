resource "aws_vpc" "vpc-create-main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "${local.SERVICE_NAME}-create"
  }
}

resource "aws_internet_gateway" "vpc-create-igw" {
  vpc_id = aws_vpc.vpc-create-main.id

  tags = {
    Name = "${local.SERVICE_NAME}-create-ig"
  }
}