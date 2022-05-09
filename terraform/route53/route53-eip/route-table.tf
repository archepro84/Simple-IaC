resource "aws_route_table" "route53-eip-rtb" {
  vpc_id = aws_vpc.route53-eip-main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.route53-eip-igw.id
  }

  tags = {
    Name = "${local.SERVICE_NAME}-rtb"
  }
}

resource "aws_route" "route53-eip-rtb-route" {
  route_table_id         = aws_route_table.route53-eip-rtb.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.route53-eip-igw.id
}

resource "aws_route_table_association" "route53-eip-route-table-association" {
  subnet_id      = aws_subnet.route53-eip-subnet.id
  route_table_id = aws_route_table.route53-eip-rtb.id
}