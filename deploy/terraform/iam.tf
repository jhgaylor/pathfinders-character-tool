resource "aws_iam_role" "pathfinder-character-tool" {
  name = "${data.terraform_remote_state.dev_vpc.vpc_name}-pathfinder-character-tool"
  assume_role_policy = "${data.terraform_remote_state.core.policy-assume-ec2}"
}

resource "aws_iam_role_policy" "pathfinder-character-tool" {
  name = "${data.terraform_remote_state.dev_vpc.vpc_name}-pathfinder-character-tool"
  role = "${aws_iam_role.pathfinder-character-tool.id}"
  policy = "${data.terraform_remote_state.core.policy-read-sw-releases}"
}


resource "aws_iam_instance_profile" "pathfinder-character-tool" {
  name = "${data.terraform_remote_state.dev_vpc.vpc_name}-pathfinder-character-tool"
  roles = ["${aws_iam_role.pathfinder-character-tool.name}"]
}