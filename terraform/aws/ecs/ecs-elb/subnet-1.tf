resource "aws_subnet" "ecs-elb-subnet-1" {
  vpc_id            = aws_vpc.ecs-elb-main.id
  cidr_block        = "10.5.0.0/24"
  availability_zone = "${local.REGION}a"

  tags = {
    Name = "${local.SERVICE_NAME}-subnet-1"
  }
}