  description = "For pathfinder-character-tool instances"
resource "aws_iam_role" "pathfinder-character-tool" {
  name = "${terraform_remote_state.dev_vpc.output.vpc_name}-pathfinder-character-tool"
  assume_role_policy = "${terraform_remote_state.core.policy-assume-ec2"
}

resource "aws_iam_role_policy" "pathfinder-character-tool" {
  name = "${terraform_remote_state.dev_vpc.output.vpc_name}-pathfinder-character-tool"

  policy = "${terraform_remote_state.core.policy-read-sw-releases}"
}


resource "aws_iam_instance_profile" "pathfinder-character-tool" {
  name = "${terraform_remote_state.dev_vpc.output.vpc_name}-pathfinder-character-tool"
  roles = ["${aws_iam_role.pathfinder-character-tool.name}"]
}