resource "aws_subnet" "elb-subnet-two" {
  vpc_id            = aws_vpc.elb-main.id
  cidr_block        = "10.2.1.0/24"
  availability_zone = "${local.REGION}c"

  tags = {
    Name = "${local.SERVICE_NAME}-subnet-two"
  }
}