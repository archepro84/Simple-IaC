resource "aws_default_network_acl" "ecs-elb-nacl" {
  default_network_acl_id = aws_vpc.ecs-elb-main.default_network_acl_id

  tags = {
    Name = "${local.SERVICE_NAME}-nacl"
  }
}


resource "aws_network_acl_rule" "ecs-elb-nacl-ingress-all-allow" {
  network_acl_id = aws_default_network_acl.ecs-elb-nacl.default_network_acl_id
  rule_number    = 100
  rule_action    = "allow"
  egress         = false
  from_port      = 0
  to_port        = 0
  protocol       = "-1"
  cidr_block     = "0.0.0.0/0"
}

resource "aws_network_acl_rule" "ecs-elb-nacl-ingress-all-deny" {
  network_acl_id = aws_default_network_acl.ecs-elb-nacl.default_network_acl_id
  rule_number    = 200
  rule_action    = "deny"
  egress         = false
  from_port      = 0
  to_port        = 0
  protocol       = "-1"
  cidr_block     = "0.0.0.0/0"
}

resource "aws_network_acl_rule" "ecs-elb-nacl-egress-all" {
  network_acl_id = aws_default_network_acl.ecs-elb-nacl.default_network_acl_id
  rule_number    = 100
  rule_action    = "allow"
  egress         = true
  from_port      = 0
  to_port        = 0
  protocol       = "-1"
  cidr_block     = "0.0.0.0/0"
}

resource "aws_network_acl_rule" "ecs-elb-nacl-egress-all-deny" {
  network_acl_id = aws_default_network_acl.ecs-elb-nacl.default_network_acl_id
  rule_number    = 200
  rule_action    = "deny"
  egress         = true
  from_port      = 0
  to_port        = 0
  protocol       = "-1"
  cidr_block     = "0.0.0.0/0"
}