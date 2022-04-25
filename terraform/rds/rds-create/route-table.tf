resource "aws_route" "rds-create-rtb-route" {
  route_table_id         = aws_vpc.rds-create-main.default_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.rds-create-igw.id
}

resource "aws_route_table_association" "rds-create-route-table-association" {
  subnet_id      = aws_subnet.rds-create-subnet.id
  route_table_id = aws_vpc.rds-create-main.default_route_table_id
}