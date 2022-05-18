resource "aws_vpc" "elb-main" {
  cidr_block = "10.2.0.0/16"

  tags = {
    Name = "${local.SERVICE_NAME}"
  }
}

resource "aws_internet_gateway" "elb-igw" {
  vpc_id = aws_vpc.elb-main.id

  tags = {
    Name = "${local.SERVICE_NAME}-igw"
  }
}