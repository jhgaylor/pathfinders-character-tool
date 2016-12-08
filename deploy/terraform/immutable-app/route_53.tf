resource "aws_route53_record" "cname-app" {
    zone_id = "${var.zone_id}"
    name = "${var.dns_name}"
    type = "CNAME"
    ttl = "30"
    records = ["${aws_instance.app.public_dns}"]
}
