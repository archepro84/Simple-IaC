resource "aws_acm_certificate" "acm-create-acm" {
  domain_name       = local.ROUTE53_URI
  validation_method = "DNS"


  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate_validation" "acm-create-acm-validation" {
  certificate_arn         = aws_acm_certificate.acm-create-acm.arn
  validation_record_fqdns = [for record in aws_route53_record.acm-create-route53-record : record.fqdn]
}