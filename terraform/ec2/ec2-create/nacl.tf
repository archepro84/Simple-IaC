resource "aws_network_acl_rule" "ec2-create-nacl-ingress-all" {
  network_acl_id = aws_vpc.ec2-create-main.default_network_acl_id
  rule_number    = 100
  rule_action    = "allow"
  egress         = false
  from_port      = 0
  to_port        = 0
  protocol       = "-1"
  cidr_block     = "0.0.0.0/0"
}

resource "aws_network_acl_rule" "ec2-create-nacl-egress-all" {
  network_acl_id = aws_vpc.ec2-create-main.default_network_acl_id
  rule_number    = 100
  rule_action    = "allow"
  egress         = true
  from_port      = 0
  to_port        = 0
  protocol       = "-1"
  cidr_block     = "0.0.0.0/0"
}

resource "aws_network_acl_association" "ec2-create-nacl-association" {
  network_acl_id = aws_vpc.ec2-create-main.default_network_acl_id
  subnet_id = aws_subnet.ec2-create-subnet.id
}