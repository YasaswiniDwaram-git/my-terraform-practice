resource "aws_route53_record" "expense" {
  for_each = aws_instance.foreach
  zone_id = data.aws_route53_zone.hosted_zone.zone_id
  name    = each.key
  type    = "A"
  ttl     = 1
  records = [each.value.public_ip] 


}