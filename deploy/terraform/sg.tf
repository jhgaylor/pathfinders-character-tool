resource "aws_security_group" "pathfinder-character-tool" {
  name = "${terraform_remote_state.dev_vpc.output.vpc_name}-pathfinder-character-tool"
  description = "For pathfinder-character-tool instances"
  vpc_id = "${terraform_remote_state.dev_vpc.output.vpc_id}"
}