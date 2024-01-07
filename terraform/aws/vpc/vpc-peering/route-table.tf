# VPC A, Route Table
resource "aws_default_route_table" "a" {
  default_route_table_id = aws_vpc.a.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.a.id
  }

  tags = {
    Name = "${var.project_name}-rt-a"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.a.id
  route_table_id = aws_default_route_table.a.id
}


# VPC B, Route Table
resource "aws_default_route_table" "b" {
  default_route_table_id = aws_vpc.b.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.b.id
  }

  tags = {
    Name = "${var.project_name}-rt-b"
  }
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.b.id
  route_table_id = aws_default_route_table.b.id
}