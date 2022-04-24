resource "aws_default_route_table" "cpv-create-default-rt"{
  default_route_table_id = aws_vpc.vpc-create-main.default_route_table_id
}

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

resource "aws_route" "vpc-create-route" {
  route_table_id = aws_vpc.vpc-create-main.default_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.vpc-create-ig.id
}

resource "aws_route_table_association" "vpc-create-public-route-table-association"{
  subnet_id = aws_subnet.vpc-create-public-subnet.id
  route_table_id = aws_route_table.vpc-create-public-rtb.id
}

resource "aws_subnet" "vpc-create-public-subnet" {
  vpc_id     = aws_vpc.vpc-create-main.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "${local.REGION}a"

  tags = {
    Name = "${local.SERVICE_NAME}-create-public-subnet"
  }
}