resource "aws_route_table" "ec2-create-rtb" {
  vpc_id = aws_vpc.ec2-create-main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ec2-create-igw.id
  }

  tags = {
    Name = "${local.SERVICE_NAME}-rtb"
  }
}

resource "aws_route" "ec2-create-rtb-route" {
  route_table_id         = aws_route_table.ec2-create-rtb.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.ec2-create-igw.id
}

resource "aws_route_table_association" "ec2-create-route-table-association" {
  subnet_id      = aws_subnet.ec2-create-subnet.id
  route_table_id = aws_route_table.ec2-create-rtb.id
}