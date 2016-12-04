resource "aws_security_group" "pathfinder-character-tool" {
  name        = "${data.terraform_remote_state.dev_vpc.vpc_name}-pathfinder-character-tool"
  description = "For pathfinder-character-tool instances"
  vpc_id      = "${data.terraform_remote_state.dev_vpc.vpc_id}"
}
