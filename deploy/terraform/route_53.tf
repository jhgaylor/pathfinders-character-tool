
resource "aws_route53_record" "cname-app" {
    zone_id = "${data.terraform_remote_state.core.main_zone_id}"
    name = "${var.subdomain}.opslab.xyz."
    type = "CNAME"
    ttl = "30"
    records = ["${aws_instance.pathfinder-character-tool.public_dns}"]
}
