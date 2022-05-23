resource "aws_security_group" "ecs-elb-security-group-1" {
  name        = "${local.SERVICE_NAME}-security-group-1"
  description = "${local.SERVICE_NAME}-security-group-1 Description"
  vpc_id      = aws_vpc.ecs-elb-main.id

  tags = {
    Name = "${local.SERVICE_NAME}-security-group-1"
  }
}

resource "aws_security_group_rule" "ecs-elb-security-group-inbound-rules-server-1" {
  type              = "ingress"
  from_port         = local.SERVER_PORT
  to_port           = local.SERVER_PORT
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ecs-elb-security-group-1.id
}

resource "aws_security_group_rule" "ecs-elb-security-group-rule-outbound-rules-all-1" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ecs-elb-security-group-1.id
}

#resource "aws_network_interface" "ecs-elb-ni-1" {
#  subnet_id       = aws_subnet.ecs-elb-subnet-1.id
#  security_groups = [aws_security_group.ecs-elb-security-group-1.id]
#
#  tags = {
#    Name = "${local.SERVICE_NAME}-ni-1"
#  }
#}