resource "aws_subnet" "route53-eip-subnet" {
  vpc_id            = aws_vpc.route53-eip-main.id
  cidr_block        = "10.4.0.0/24"
  availability_zone = "${local.REGION}a"

  tags = {
    Name = "${local.SERVICE_NAME}-subnet"
  }
}