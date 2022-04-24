resource "aws_route_table" "vpc-create-public-rtb" {
  vpc_id = aws_vpc.vpc-create-main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpc-create-igw.id
  }

  tags = {
    Name = "${local.SERVICE_NAME}-create-public-rtb"
  }
}

# routing table rule
resource "aws_route" "vpc-create-public-rtb-route" {
  #  route_table_id         = aws_vpc.vpc-create-main.default_route_table_id
  route_table_id         = aws_route_table.vpc-create-public-rtb.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.vpc-create-igw.id
}

resource "aws_route_table_association" "vpc-create-public-route-table-association" {
  subnet_id      = aws_subnet.vpc-create-public-subnet.id
  route_table_id = aws_route_table.vpc-create-public-rtb.id
}

resource "aws_default_route_table" "cpv-create-default-rt" {
  default_route_table_id = aws_vpc.vpc-create-main.default_route_table_id
}