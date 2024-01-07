# VPC A, Subnet
resource "aws_subnet" "a" {
  vpc_id            = aws_vpc.a.id
  cidr_block        = "10.24.16.0/20"
  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "${var.project_name}-subnet-a"
  }
}


# VPC B, Subnet
resource "aws_subnet" "b" {
  vpc_id            = aws_vpc.b.id
  cidr_block        = "10.25.16.0/20"
  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "${var.project_name}-subnet-b"
  }
}