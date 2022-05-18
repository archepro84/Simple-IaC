resource "aws_security_group" "ec2-create-security-group" {
  name        = "ec2-create-security-group"
  description = "ec2-create-security-group"
  vpc_id      = aws_vpc.ec2-create-main.id
}

resource "aws_security_group_rule" "ec2-create-security-group-rule-ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ec2-create-security-group.id
}

resource "aws_security_group_rule" "ec2-create-security-group-rule-http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ec2-create-security-group.id
}

resource "aws_security_group_rule" "ec2-create-security-group-rule-https" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ec2-create-security-group.id
}

resource "aws_security_group_rule" "ec2-create-security-group-rule-server" {
  type              = "ingress"
  from_port         = local.SERVER_PORT
  to_port           = local.SERVER_PORT
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ec2-create-security-group.id
}

resource "aws_security_group_rule" "ec2-create-security-group-rule-egress-all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ec2-create-security-group.id
}

resource "aws_network_interface" "ec2-create-ec2-ni" {
  subnet_id       = aws_subnet.ec2-create-subnet.id
  security_groups = [aws_security_group.ec2-create-security-group.id]

  tags = {
    Name = "${local.SERVICE_NAME}-ec2-ni"
  }
}