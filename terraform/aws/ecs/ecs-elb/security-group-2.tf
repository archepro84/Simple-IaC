resource "aws_security_group" "ecs-elb-security-group-2" {
  name        = "${local.SERVICE_NAME}-security-group-2"
  description = "${local.SERVICE_NAME}-security-group-2 Description"
  vpc_id      = aws_vpc.ecs-elb-main.id

  tags = {
    Name = "${local.SERVICE_NAME}-security-group-2"
  }
}

resource "aws_security_group_rule" "ecs-elb-security-group-inbound-rules-server-2" {
  type              = "ingress"
  from_port         = local.SERVER_PORT
  to_port           = local.SERVER_PORT
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ecs-elb-security-group-2.id
}

resource "aws_security_group_rule" "ecs-elb-security-group-rule-outbound-rules-all-2" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ecs-elb-security-group-2.id
}

#resource "aws_network_interface" "ecs-elb-ni-2" {
#  subnet_id       = aws_subnet.ecs-elb-subnet-2.id
#  security_groups = [aws_security_group.ecs-elb-security-group-2.id]
#
#  tags = {
#    Name = "${local.SERVICE_NAME}-ni-2"
#  }
#}