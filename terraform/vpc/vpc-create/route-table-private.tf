resource "aws_route_table" "vpc-create-private-rtb" {
  vpc_id = aws_vpc.vpc-create-main.id

  tags = {
    Name = "${local.SERVICE_NAME}-create-private-rtb"
  }
}

resource "aws_route" "vpc-create-private-rtb-route" {
  route_table_id         = aws_route_table.vpc-create-private-rtb.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_nat_gateway.vpc-create-nat-gateway.id
}

resource "aws_route_table_association" "vpc-create-private-route-table-association" {
  subnet_id      = aws_subnet.vpc-create-private-subnet.id
  route_table_id = aws_route_table.vpc-create-private-rtb.id
}