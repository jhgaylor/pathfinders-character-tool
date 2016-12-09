resource "aws_ebs_volume" "db" {
    availability_zone = "${element(data.terraform_remote_state.dev_vpc.public_subnet_azs, count.index % length(data.terraform_remote_state.dev_vpc.public_subnet_azs))}"
    size = 5
    tags {
        Name = "${var.app_name}-db-storage"
    }
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/xvdb"
  volume_id = "${aws_ebs_volume.db.id}"
  instance_id = "${module.pathfinder-character-tool.app-instance-id}"
  # i want the ebs volume to live much longer than the app
  skip_destroy = true
}