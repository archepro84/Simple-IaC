resource "aws_route53_zone" "route53-eip-route53-zone" {
  name = local.ROUTE53_URI
}


resource "aws_route53_record" "route53-eip-route53-record-http" {
  zone_id = aws_route53_zone.route53-eip-route53-zone.id

  name    = "${local.ROUTE53_URI}"
  type    = "A"
  ttl     = 20
  records = [aws_eip.route53-eip-eip.public_ip]
}

resource "aws_route53_record" "route53-eip-route53-record-www" {
  zone_id = aws_route53_zone.route53-eip-route53-zone.id

  name    = "www.${local.ROUTE53_URI}"
  type    = "CNAME"
  ttl     = 20
  records = [aws_route53_record.route53-eip-route53-record-http.name]
}