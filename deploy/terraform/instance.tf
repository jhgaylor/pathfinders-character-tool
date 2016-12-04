resource "aws_instance" "pathfinder-character-tool" {
  ami      = "ami-34913254"
  key_name = "jake-laptop-aws"

  iam_instance_profile = "${aws_iam_instance_profile.pathfinder-character-tool.name}"
  instance_type        = "t2.small"
  subnet_id            = "${element(data.terraform_remote_state.dev_vpc.private_subnet_ids, 1)}"
  user_data            = "${file("../bootstrap-instance.sh")}"

  tags {
    Name = "${lower(data.terraform_remote_state.dev_vpc.vpc_name)}-pathfinder-character-tool"
  }
}

# TODO keypair in main tf

