resource "aws_security_group" "rds-create-security-group" {
  name        = "rds-create-security-group"
  description = "rds-create-security-group"
  vpc_id      = aws_vpc.rds-create-main.id
}

resource "aws_security_group_rule" "rds-create-security-group-rule-mysql-aurora" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.rds-create-security-group.id
}

resource "aws_security_group_rule" "rds-create-security-group-rule-self" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  self              = true
  security_group_id = aws_security_group.rds-create-security-group.id
}

resource "aws_security_group_rule" "rds-create-security-group-rule-egress-all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.rds-create-security-group.id
}

resource "aws_network_interface" "rds-create-rds-ni" {
  subnet_id       = aws_subnet.rds-create-subnet.id
  security_groups = [aws_security_group.rds-create-security-group.id]

  tags = {
    Name = "${local.SERVICE_NAME}-create-ni"
  }
}