resource "aws_security_group" "vpc-create-public-security-group" {
  name        = "vpc-create-public-security-group"
  description = "vpc-create-public-security-group"
  vpc_id      = aws_vpc.vpc-create-main.id
}

resource "aws_security_group_rule" "vpc-create-public-security-group-rule-ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.vpc-create-public-security-group.id
}

resource "aws_security_group_rule" "vpc-create-public-security-group-rule-http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.vpc-create-public-security-group.id
}

resource "aws_security_group_rule" "vpc-create-public-security-group-rule-https" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.vpc-create-public-security-group.id
}

resource "aws_security_group_rule" "vpc-create-public-security-group-rule-egress-all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.vpc-create-public-security-group.id
}


resource "aws_network_interface" "vpc-create-public-ec2-ni" {
  subnet_id       = aws_subnet.vpc-create-public-subnet.id
  security_groups = [aws_security_group.vpc-create-public-security-group.id]

  tags = {
    Name = "${local.SERVICE_NAME}-create-public-ec2-ni"
  }
}