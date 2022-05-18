resource "aws_security_group" "route53-eip-security-group" {
  name        = "route53-eip-security-group"
  description = "route53-eip-security-group"
  vpc_id      = aws_vpc.route53-eip-main.id
}

resource "aws_security_group_rule" "route53-eip-security-group-rule-ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.route53-eip-security-group.id
}

resource "aws_security_group_rule" "route53-eip-security-group-rule-http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.route53-eip-security-group.id
}

resource "aws_security_group_rule" "route53-eip-security-group-rule-server" {
  type              = "ingress"
  from_port         = local.SERVER_PORT
  to_port           = local.SERVER_PORT
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.route53-eip-security-group.id
}

resource "aws_security_group_rule" "route53-eip-security-group-rule-egress-all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.route53-eip-security-group.id
}

resource "aws_network_interface" "route53-eip-ec2-ni" {
  subnet_id       = aws_subnet.route53-eip-subnet.id
  security_groups = [aws_security_group.route53-eip-security-group.id]

  tags = {
    Name = "${local.SERVICE_NAME}-ec2-ni"
  }
}