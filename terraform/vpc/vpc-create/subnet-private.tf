resource "aws_subnet" "vpc-create-private-subnet" {
  vpc_id            = aws_vpc.vpc-create-main.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "${local.REGION}c"

  tags = {
    Name = "${local.SERVICE_NAME}-create-private-subnet"
  }
}