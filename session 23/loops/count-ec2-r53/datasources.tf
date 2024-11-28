data "aws_route53_zone" "hosted_zone" {
  name         = "yashd.icu"
  private_zone = false
}
