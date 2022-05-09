resource "aws_network_acl_rule" "route53-eip-nacl-ingress-all" {
  network_acl_id = aws_vpc.route53-eip-main.default_network_acl_id
  rule_number    = 100
  rule_action    = "allow"
  egress         = false
  from_port      = 0
  to_port        = 0
  protocol       = "-1"
  cidr_block     = "0.0.0.0/0"
}

resource "aws_network_acl_rule" "route53-eip-nacl-egress-all" {
  network_acl_id = aws_vpc.route53-eip-main.default_network_acl_id
  rule_number    = 100
  rule_action    = "allow"
  egress         = true
  from_port      = 0
  to_port        = 0
  protocol       = "-1"
  cidr_block     = "0.0.0.0/0"
}

resource "aws_network_acl_association" "route53-eip-nacl-association" {
  network_acl_id = aws_vpc.route53-eip-main.default_network_acl_id
  subnet_id = aws_subnet.route53-eip-subnet.id
}