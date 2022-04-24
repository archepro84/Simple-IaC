resource "aws_route_table" "vpc-create-private-rtb" {
  vpc_id = aws_vpc.vpc-create-main.id

  tags = {
    Name = "${local.SERVICE_NAME}-create-private-rtb"
  }
}

resource "aws_route_table_association" "vpc-create-private-route-table-association"{
  subnet_id = aws_subnet.vpc-create-private-subnet.id
  route_table_id = aws_route_table.vpc-create-private-rtb.id
}

resource "aws_subnet" "vpc-create-private-subnet" {
  vpc_id     = aws_vpc.vpc-create-main.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "${local.REGION}c"

  tags = {
    Name = "${local.SERVICE_NAME}-create-private-subnet"
  }
}