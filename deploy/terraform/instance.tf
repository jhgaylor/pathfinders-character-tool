resource "aws_instance" "pathfinder-character-tool" {
  ami                    = "${var.app_ami_id}"
  count                  = "${var.instance_count}"
  instance_type          = "${var.instance_type}"
  subnet_id              = "${element(data.terraform_remote_state.dev_vpc.public_subnet_ids, 1)}"
  iam_instance_profile   = "${aws_iam_instance_profile.pathfinder-character-tool.name}"
  key_name               = "${var.key_pair_name}"

  vpc_security_group_ids = [
    "${data.terraform_remote_state.dev_vpc.base_security_group_id}",
    "${aws_security_group.pathfinder-character-tool.id}"
  ]

  tags {
    Name = "${lower(data.terraform_remote_state.dev_vpc.vpc_name)}-pathfinder-character-tool"
    App  = "pathfinder-character-tool"
    Env  = "development"
    Owner = "jake"
  }
}
