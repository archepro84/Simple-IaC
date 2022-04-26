resource "aws_subnet" "rds-create-subnet" {
  vpc_id            = aws_vpc.rds-create-main.id
  cidr_block        = "10.1.1.0/24"
  availability_zone = "${local.REGION}a"

  tags = {
    Name = "${local.SERVICE_NAME}-create-subnet"
  }
}

# FIX: DBSubnetGroupDoesNotCoverEnoughAZs
resource "aws_subnet" "rds-create-subnet-b" {
  vpc_id            = aws_vpc.rds-create-main.id
  cidr_block        = "10.1.2.0/24"
  availability_zone = "${local.REGION}b"

  tags = {
    Name = "${local.SERVICE_NAME}-create-subnet"
  }
}