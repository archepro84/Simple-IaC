resource "aws_subnet" "ecs-elb-subnet-2" {
  vpc_id            = aws_vpc.ecs-elb-main.id
  cidr_block        = "10.5.1.0/24"
  availability_zone = "${local.REGION}c"

  tags = {
    Name = "${local.SERVICE_NAME}-subnet-2"
  }
}