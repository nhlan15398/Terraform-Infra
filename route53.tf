resource "aws_route53_zone" "dtsgcorp" {
  name = "dtsgcorp.com"
}

resource "aws_route53_record" "dtsgcorp" {
  allow_overwrite = true
  name            = "www.dtsgcorp.com"
  ttl             = 172800
  type            = "A"
  zone_id         = aws_route53_zone.dtsgcorp.zone_id
  records = [aws_eip.lb.public_ip]
}