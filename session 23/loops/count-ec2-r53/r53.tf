resource "aws_route53_record" "expense" {
  count = length(var.instance_names)
  zone_id = data.aws_route53_zone.hosted_zone.zone_id
  name    = "${var.instance_names[count.index]}" == "frontend" ? "${var.domain_name}" : "${var.instance_names[count.index]}.${var.domain_name}"
  type    = "A"
  ttl     = 1
  records = var.instance_names[count.index] == "frontend" ? [aws_instance.session_23[count.index].public_ip] : [aws_instance.session_23[count.index].private_ip]
  allow_overwrite = true
}