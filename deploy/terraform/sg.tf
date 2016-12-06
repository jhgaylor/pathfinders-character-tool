resource "aws_security_group" "pathfinder-character-tool" {
  name        = "${data.terraform_remote_state.dev_vpc.vpc_name}-pathfinder-character-tool"
  description = "For pathfinder-character-tool instances"
  vpc_id      = "${data.terraform_remote_state.dev_vpc.vpc_id}"

  ingress {
    from_port  = 80
    to_port    = 80
    protocol   = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
