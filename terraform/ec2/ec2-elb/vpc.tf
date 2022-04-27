resource "aws_vpc" "vpc-create-main" {
  cidr_block = "10.2.0.0/16"

  tags = {
    Name = "${local.SERVICE_NAME}"
  }
}

resource "aws_internet_gateway" "vpc-create-igw" {
  vpc_id = aws_vpc.vpc-create-main.id

  tags = {
    Name = "${local.SERVICE_NAME}-igw"
  }
}