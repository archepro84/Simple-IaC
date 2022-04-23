resource "aws_route_table" "vpc-create-public-rtb" {
  vpc_id = aws_vpc.vpc-create-main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpc-create-ig.id
  }

  tags = {
    Name = "${local.SERVICE_NAME}-create-public-rtb"
  }
}

resource "aws_subnet" "vpc-create-public-subnet" {
  vpc_id     = aws_vpc.vpc-create-main.id
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "${local.SERVICE_NAME}-create-public-subnet"
  }
}