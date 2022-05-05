resource "aws_security_group" "elb-security-group-two" {
  name        = "elb-security-group-two"
  description = "elb-security-group-two"
  vpc_id      = aws_vpc.elb-main.id
}

resource "aws_security_group_rule" "elb-security-group-rule-ssh-two" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.elb-security-group-two.id
}

resource "aws_security_group_rule" "elb-security-group-rule-http-two" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.elb-security-group-two.id
}

resource "aws_security_group_rule" "elb-security-group-rule-https-two" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.elb-security-group-two.id
}

resource "aws_security_group_rule" "elb-security-group-rule-egress-all-two" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.elb-security-group-two.id
}

resource "aws_network_interface" "elb-ec2-two-ni" {
  subnet_id       = aws_subnet.elb-subnet-two.id
  security_groups = [aws_security_group.elb-security-group-two.id]

  tags = {
    Name = "${local.SERVICE_NAME}-ec2-two-ni"
  }
}