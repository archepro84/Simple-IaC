resource "aws_route_table" "elb-rtb-two" {
  vpc_id = aws_vpc.elb-main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.elb-igw.id
  }

  tags = {
    Name = "${local.SERVICE_NAME}-rtb-two"
  }
}

resource "aws_route" "elb-rtb-route-two" {
  route_table_id         = aws_route_table.elb-rtb-two.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.elb-igw.id
}

resource "aws_route_table_association" "elb-route-table-association-two" {
  subnet_id      = aws_subnet.elb-subnet-two.id
  route_table_id = aws_route_table.elb-rtb-two.id
}