resource "aws_subnet" "rds-create-subnet" {
  vpc_id            = aws_vpc.rds-create-main.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "${local.REGION}a"

  tags = {
    Name = "${local.SERVICE_NAME}-create-subnet"
  }
}