resource "aws_subnet" "vpc-create-public-subnet" {
  vpc_id            = aws_vpc.vpc-create-main.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "${local.REGION}a"

  tags = {
    Name = "${local.SERVICE_NAME}-create-public-subnet"
  }
}