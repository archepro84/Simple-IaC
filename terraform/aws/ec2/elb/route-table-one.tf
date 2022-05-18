resource "aws_route_table" "elb-rtb-one" {
  vpc_id = aws_vpc.elb-main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.elb-igw.id
  }

  tags = {
    Name = "${local.SERVICE_NAME}-rtb-one"
  }
}

resource "aws_route" "elb-rtb-route-one" {
  route_table_id         = aws_route_table.elb-rtb-one.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.elb-igw.id
}

resource "aws_route_table_association" "elb-route-table-association-one" {
  subnet_id      = aws_subnet.elb-subnet-one.id
  route_table_id = aws_route_table.elb-rtb-one.id
}