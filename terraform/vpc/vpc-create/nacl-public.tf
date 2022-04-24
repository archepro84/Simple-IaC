resource "aws_network_acl" "vpc-create-public-nacl" {
  vpc_id = aws_vpc.vpc-create-main.id

  tags = {
    Name = "vpc-create-public-nacl"
  }
}

resource "aws_network_acl_rule" "vpc-create-public-nacl-ingress-all" {
  network_acl_id = aws_network_acl.vpc-create-public-nacl.id
  rule_number    = 100
  rule_action    = "allow"
  egress         = false
  from_port      = 0
  to_port        = 0
  protocol       = "-1"
  cidr_block     = "0.0.0.0/0"
}

resource "aws_network_acl_rule" "vpc-create-public-nacl-egress-all" {
  network_acl_id = aws_network_acl.vpc-create-public-nacl.id
  rule_number    = 100
  rule_action    = "allow"
  egress         = true
  from_port      = 0
  to_port        = 0
  protocol       = "-1"
  cidr_block     = "0.0.0.0/0"
}

resource "aws_default_network_acl" "vpc-create-default-nacl" {
  default_network_acl_id = aws_network_acl.vpc-create-public-nacl.id
}