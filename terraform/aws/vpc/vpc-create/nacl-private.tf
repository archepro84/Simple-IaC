resource "aws_default_network_acl" "vpc-create-default-nacl" {
  default_network_acl_id = aws_vpc.vpc-create-main.default_network_acl_id

  tags = {
    Name = "vpc-create-private-nacl"
  }
}

resource "aws_network_acl_rule" "vpc-create-private-nacl-ingress-all" {
  network_acl_id = aws_vpc.vpc-create-main.default_network_acl_id
  rule_number    = 100
  rule_action    = "allow"
  egress         = false
  from_port      = 0
  to_port        = 0
  protocol       = "-1"
  cidr_block     = "0.0.0.0/0"
}

resource "aws_network_acl_rule" "vpc-create-private-nacl-egress-all" {
  network_acl_id = aws_vpc.vpc-create-main.default_network_acl_id
  rule_number    = 100
  rule_action    = "allow"
  egress         = true
  from_port      = 0
  to_port        = 0
  protocol       = "-1"
  cidr_block     = "0.0.0.0/0"
}

resource "aws_network_acl_association" "vpc-create-private-nacl-association" {
  network_acl_id = aws_vpc.vpc-create-main.default_network_acl_id
  subnet_id = aws_subnet.vpc-create-private-subnet.id
}