resource "aws_route_table" "ecs-elb-rtb" {
  vpc_id = aws_vpc.ecs-elb-main.id

  tags = {
    Name = "${local.SERVICE_NAME}-rtb"
  }
}

resource "aws_route" "ecs-elb-rtb-route" {
  route_table_id         = aws_route_table.ecs-elb-rtb.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.ecs-elb-igw.id
}

resource "aws_route_table_association" "ecs-elb-route-table-association-1" {
  subnet_id      = aws_subnet.ecs-elb-subnet-1.id
  route_table_id = aws_route_table.ecs-elb-rtb.id
}

resource "aws_route_table_association" "ecs-elb-route-table-association-2" {
  subnet_id      = aws_subnet.ecs-elb-subnet-2.id
  route_table_id = aws_route_table.ecs-elb-rtb.id
}