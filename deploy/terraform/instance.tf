resource "aws_instance" "pathfinder-character-tool" {
  ami      = "ami-34913254"
  key_name = "jake-laptop-aws"

  iam_instance_profile = "${aws_iam_instance_profile.pathfinder-character-tool.name}"
  instance_type        = "t2.small"
  user_data            = "${file("../bootstrap-instance.sh")}"

  tags {
    Name = "${data.terraform_remote_state.dev_vpc.vpc_name}-pathfinder-character-tool"
  }
}

# TODO keypair in main tf

