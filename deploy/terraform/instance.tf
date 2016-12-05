resource "aws_instance" "pathfinder-character-tool" {
  ami                    = "${var.base_ami_id}"
  key_name               = "${var.key_pair_name}"
  iam_instance_profile   = "${aws_iam_instance_profile.pathfinder-character-tool.name}"
  instance_type          = "${var.instance_type}"
  subnet_id              = "${element(data.terraform_remote_state.dev_vpc.public_subnet_ids, 1)}"
  # count                  = 0
  # we need the user data to get the box into shape for the ansible provisioner, which is poorly maintained at the time of writing.
  user_data              = "${file("../bootstrap-instance.sh")}"
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

  provisioner "ansible" {
    connection {
      user = "ubuntu"
      private_key = "${file("/Users/jake/.ssh/jake-laptop-aws.pem")}"
    }

    playbook = "../ansible/playbook.yaml"
    groups = ["all"] # these get created and shoved in the inventory. they don't really mean much. needs to match the playbook.
    hosts = ["all"] # these get created and shoved in the inventory. they don't really mean much. needs to match the playbook.
    # extra_vars {
    #   region = "us-west-2"
    #   app_version = "0.0.3"
    #   app_name = "pathfinder-character-tool"
    # }
  }
}

# TODO keypair in main tf
