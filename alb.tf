resource "aws_lb" "application-load-balancer" {
  name               = "alb"
  tags               = {
    Environment = "develop"
  }
  internal           = false
  load_balancer_type = "application"

  security_groups = [aws_security_group.lb_sg.id]


  subnets                          = [aws_subnet.public_subnet.id]
  enable_cross_zone_load_balancing = true
  enable_http2                     = true
  idle_timeout                     = 60
  ip_address_type                  = "ipv4"
  enable_deletion_protection       = false
  drop_invalid_header_fields       = false

  access_logs {
    bucket  = [aws_s3_bucket.lb_logs.bucket]
    prefix  = "log-alb"
    enabled = true
}
}