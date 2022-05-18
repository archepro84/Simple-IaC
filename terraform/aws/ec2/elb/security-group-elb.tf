resource "aws_security_group" "elb-security-group-elb" {
  name        = "elb-security-group-elb"
  description = "elb-security-group-elb"
  vpc_id      = aws_vpc.elb-main.id
}

resource "aws_security_group_rule" "elb-security-group-rule-ssh-elb" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.elb-security-group-elb.id
}

resource "aws_security_group_rule" "elb-security-group-rule-http-elb" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.elb-security-group-elb.id
}

resource "aws_security_group_rule" "elb-security-group-rule-https-elb" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.elb-security-group-elb.id
}

resource "aws_security_group_rule" "elb-security-group-rule-egress-all-elb" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.elb-security-group-elb.id
}

#resource "aws_network_interface" "elb-ec2-elb-ni" {
#  subnet_id       = aws_subnet.elb-subnet-elb.id
#  security_groups = [aws_security_group.elb-security-group-elb.id]
#
#  tags = {
#    Name = "${local.SERVICE_NAME}-ec2-elb-ni"
#  }
#}