resource "aws_vpc" "route53-eip-main" {
  cidr_block = "10.4.0.0/16"

  tags = {
    Name = "${local.SERVICE_NAME}-vpc"
  }
}

resource "aws_internet_gateway" "route53-eip-igw" {
  vpc_id = aws_vpc.route53-eip-main.id

  tags = {
    Name = "${local.SERVICE_NAME}-igw"
  }
}