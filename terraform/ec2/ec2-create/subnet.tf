resource "aws_subnet" "ec2-create-subnet" {
  vpc_id            = aws_vpc.ec2-create-main.id
  cidr_block        = "10.3.0.0/24"
  availability_zone = "${local.REGION}a"

  tags = {
    Name = "${local.SERVICE_NAME}-subnet"
  }
}