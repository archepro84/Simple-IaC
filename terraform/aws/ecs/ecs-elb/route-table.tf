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