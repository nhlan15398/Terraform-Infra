resource "aws_acm_certificate" "default" {
  domain_name               = var.domain_name
  subject_alternative_names = var.subject_alternative_names
  validation_method         = "DNS"

  lifecycle {
    create_before_destroy = true
  }

  tags = merge(
    {
      Name = var.domain_name
    },
    var.tags,
  )
}
resource "aws_acm_certificate_validation" "default" {
  certificate_arn = aws_acm_certificate.default.arn

  validation_record_fqdns = [for record in aws_route53_record.validation : record.fqdn]
}