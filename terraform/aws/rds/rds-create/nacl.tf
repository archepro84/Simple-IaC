resource "aws_network_acl_rule" "rds-create-nacl-ingress-all" {
  network_acl_id = aws_vpc.rds-create-main.default_network_acl_id
  rule_number    = 100
  rule_action    = "allow"
  egress         = false
  from_port      = 0
  to_port        = 0
  protocol       = "-1"
  cidr_block     = "0.0.0.0/0"
}

resource "aws_network_acl_rule" "rds-create-nacl-egress-all" {
  network_acl_id = aws_vpc.rds-create-main.default_network_acl_id
  rule_number    = 100
  rule_action    = "allow"
  egress         = true
  from_port      = 0
  to_port        = 0
  protocol       = "-1"
  cidr_block     = "0.0.0.0/0"
}

resource "aws_network_acl_association" "rds-create-nacl-association" {
  network_acl_id = aws_vpc.rds-create-main.default_network_acl_id
  subnet_id = aws_subnet.rds-create-subnet.id
}