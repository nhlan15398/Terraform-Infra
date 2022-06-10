resource "aws_route53_zone" "dtsgcorp" {
  name = "api.dtsgcorp.com"
}

resource "aws_route53_record" "dtsgcorp" {
  allow_overwrite = true
  name            = "api.dtsgcorp.com"
  ttl             = 172800
  type            = "NS"
  zone_id         = aws_route53_zone.dtsgcorp.zone_id

  records = [
    aws_route53_zone.dtsgcorp.name_servers[0],
    aws_route53_zone.dtsgcorp.name_servers[1],
    aws_route53_zone.dtsgcorp.name_servers[2],
  ]
}