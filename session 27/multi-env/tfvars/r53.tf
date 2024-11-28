resource "aws_route53_record" "expense" {
    for_each = aws_instance.expense
    name = each.key == "frontend-${var.environment}" ? var.domain_name : "${each.key}.${var.domain_name}"
    type = "A"
    zone_id = var.zone_id
    ttl = 1
    records = startswith (each.key , "frontend") ? [each.value.public_ip] : [each.value.private_ip]
    allow_overwrite = "true"
}