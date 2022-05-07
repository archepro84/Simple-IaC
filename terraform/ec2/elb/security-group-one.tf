resource "aws_security_group" "elb-security-group-one" {
  name        = "elb-security-group-one"
  description = "elb-security-group-one"
  vpc_id      = aws_vpc.elb-main.id
}

resource "aws_security_group_rule" "elb-security-group-rule-ssh-one" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.elb-security-group-one.id
}

resource "aws_security_group_rule" "elb-security-group-rule-http-one" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.elb-security-group-one.id
}

resource "aws_security_group_rule" "elb-security-group-rule-https-one" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.elb-security-group-one.id
}

resource "aws_security_group_rule" "elb-security-group-rule-server-one" {
  type              = "ingress"
  from_port         = local.SERVER_PORT
  to_port           = local.SERVER_PORT
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.elb-security-group-one.id
}

resource "aws_security_group_rule" "elb-security-group-rule-egress-all-one" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.elb-security-group-one.id
}

resource "aws_network_interface" "elb-ec2-one-ni" {
  subnet_id       = aws_subnet.elb-subnet-one.id
  security_groups = [aws_security_group.elb-security-group-one.id]

  tags = {
    Name = "${local.SERVICE_NAME}-ec2-one-ni"
  }
}