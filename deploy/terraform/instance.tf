resource "aws_instance" "pathfinder-character-tool" {
  ami                    = "ami-34913254"
  key_name               = "jake-laptop-aws"
  # count                  = 0
  iam_instance_profile   = "${aws_iam_instance_profile.pathfinder-character-tool.name}"
  instance_type          = "t2.small"
  subnet_id              = "${element(data.terraform_remote_state.dev_vpc.public_subnet_ids, 1)}"
  user_data              = "${file("../bootstrap-instance.sh")}"
  vpc_security_group_ids = ["${data.terraform_remote_state.dev_vpc.base_security_group_id}", "${aws_security_group.pathfinder-character-tool.id}"]

  tags {
    Name = "${lower(data.terraform_remote_state.dev_vpc.vpc_name)}-pathfinder-character-tool"
    App  = "pathfinder-character-tool"
    Env  = "development"
  }
}

# TODO keypair in main tf
