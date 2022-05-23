resource "aws_vpc" "ecs-elb-main" {
  cidr_block = "10.5.0.0/16"

  tags = {
    Name = "${local.SERVICE_NAME}-vpc"
  }
}

resource "aws_internet_gateway" "ecs-elb-igw" {
  vpc_id = aws_vpc.ecs-elb-main.id

  tags = {
    Name = "${local.SERVICE_NAME}-igw"
  }
}