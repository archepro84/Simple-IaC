resource "aws_vpc" "ec2-create-main" {
  cidr_block = "10.3.0.0/16"

  tags = {
    Name = "${local.SERVICE_NAME}-vpc"
  }
}

resource "aws_internet_gateway" "ec2-create-igw" {
  vpc_id = aws_vpc.ec2-create-main.id

  tags = {
    Name = "${local.SERVICE_NAME}-igw"
  }
}