# AWS Caller Identity
data "aws_caller_identity" "current" {}


# VPC Peering, VPC A -> B
resource "aws_vpc_peering_connection" "this" {
  peer_owner_id = data.aws_caller_identity.current.account_id # 대상 VPC의 계정 ID
  peer_vpc_id   = aws_vpc.b.id # 대상 VPC의 ID
  vpc_id        = aws_vpc.a.id # 현재 VPC의 ID

  auto_accept = true # 자동으로 피어링 연결을 수락할지 여부

  tags = {
    Name = "${var.project_name}-vpc-peering"
  }
}


# Add VPC Peering Route
resource "aws_route" "a_to_b" {
  route_table_id            = aws_vpc.a.default_route_table_id # 현재 VPC의 라우팅 테이블 ID
  destination_cidr_block    = aws_vpc.b.cidr_block # 대상 VPC의 CIDR 블록
  vpc_peering_connection_id = aws_vpc_peering_connection.this.id # VPC 피어링 연결 ID
}

resource "aws_route" "b_to_a" {
  route_table_id            = aws_vpc.b.default_route_table_id # 현재 VPC의 라우팅 테이블 ID
  destination_cidr_block    = aws_vpc.a.cidr_block # 대상 VPC의 CIDR 블록
  vpc_peering_connection_id = aws_vpc_peering_connection.this.id # VPC 피어링 연결 ID
}