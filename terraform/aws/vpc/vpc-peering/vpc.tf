resource "aws_vpc" "a" {
  cidr_block = "10.24.0.0/16"

  tags = {
    Name = "${var.project_name}-vpc-a"
  }
}

resource "aws_vpc" "b" {
  cidr_block = "10.25.0.0/16"

  tags = {
    Name = "${var.project_name}-vpc-b"
  }
}

resource "aws_internet_gateway" "a" {
  vpc_id = aws_vpc.a.id

  tags = {
    Name = "${var.project_name}-ig-a"
  }
}

resource "aws_internet_gateway" "b" {
  vpc_id = aws_vpc.b.id

  tags = {
    Name = "${var.project_name}-ig-b"
  }
}