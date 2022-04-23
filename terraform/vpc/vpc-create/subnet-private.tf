resource "aws_route_table" "vpc-create-private-rtb" {
  vpc_id = aws_vpc.vpc-create-main.id

  tags = {
    Name = "${local.SERVICE_NAME}-create-private-rtb"
  }
}

resource "aws_subnet" "vpc-create-private-subnet" {
  vpc_id     = aws_vpc.vpc-create-main.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "${local.SERVICE_NAME}-create-private-subnet"
  }
}