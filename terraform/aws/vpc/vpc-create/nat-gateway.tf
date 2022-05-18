resource "aws_eip" "vpc-create-nat-gateway-eip" {
  vpc = true
}

resource "aws_nat_gateway" "vpc-create-nat-gateway" {
  allocation_id = aws_eip.vpc-create-nat-gateway-eip.id
  subnet_id     = aws_subnet.vpc-create-public-subnet.id
  tags          = {
    Name = "vpc-create nat gateway"
  }
}