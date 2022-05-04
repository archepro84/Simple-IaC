resource "aws_subnet" "elb-subnet" {
  vpc_id            = aws_vpc.elb-main.id
  cidr_block        = "10.2.0.0/24"
  availability_zone = "${local.REGION}a"

  tags = {
    Name = "${local.SERVICE_NAME}-subnet"
  }
}