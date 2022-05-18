resource "aws_route53_zone" "acm-create-route53-zone" {
  name         = local.ROUTE53_URI
}


resource "aws_route53_record" "acm-create-route53-record" {
  for_each = {
    for dvo in aws_acm_certificate.acm-create-acm.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  zone_id = aws_route53_zone.acm-create-route53-zone.id
  name    = each.value.name
  records = [each.value.record]
  type    = each.value.type
  ttl     = 60
}
