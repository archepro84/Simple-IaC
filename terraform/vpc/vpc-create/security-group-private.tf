resource "aws_security_group" "vpc-create-private-security-group" {
  name        = "vpc-create-private-security-group"
  description = "vpc-create-private-security-group"
  vpc_id      = aws_vpc.vpc-create-main.id
}

resource "aws_security_group_rule" "vpc-create-private-security-group-rule-ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = [aws_vpc.vpc-create-main.cidr_block]
  security_group_id = aws_security_group.vpc-create-private-security-group.id
}

resource "aws_network_interface" "vpc-create-private-ec2-ni" {
  subnet_id = aws_subnet.vpc-create-private-subnet.id
  security_groups = [aws_security_group.vpc-create-private-security-group.id]
  
  tags = {
    Name = "${local.SERVICE_NAME}-create-private-ec2-ni"
  }
}