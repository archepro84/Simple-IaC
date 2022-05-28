resource "aws_vpc" "efs-create-main" {
  cidr_block = "10.6.0.0/16"

  tags = {
    Name = "${local.SERVICE_NAME}-vpc"
  }
}

resource "aws_internet_gateway" "efs-create-igw" {
  vpc_id = aws_vpc.efs-create-main.id

  tags = {
    Name = "${local.SERVICE_NAME}-igw"
  }
}