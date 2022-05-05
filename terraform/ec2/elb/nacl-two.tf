resource "aws_network_acl_rule" "elb-nacl-two-ingress-all" {
  network_acl_id = aws_vpc.elb-main.default_network_acl_id
  rule_number    = 100
  rule_action    = "allow"
  egress         = false
  from_port      = 0
  to_port        = 0
  protocol       = "-1"
  cidr_block     = "0.0.0.0/0"
}

resource "aws_network_acl_rule" "elb-nacl-two-egress-all" {
  network_acl_id = aws_vpc.elb-main.default_network_acl_id
  rule_number    = 100
  rule_action    = "allow"
  egress         = true
  from_port      = 0
  to_port        = 0
  protocol       = "-1"
  cidr_block     = "0.0.0.0/0"
}

resource "aws_network_acl_association" "elb-nacl-two-association" {
  network_acl_id = aws_vpc.elb-main.default_network_acl_id
  subnet_id = aws_subnet.elb-subnet-two.id
}