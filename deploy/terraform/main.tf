data "terraform_remote_state" "dev_vpc" {
  backend = "s3"

  config {
    region = "${var.aws_region}"
    bucket = "jhg-tf-remote-state"
    key    = "development/vpc.tfstate"
  }
}

data "terraform_remote_state" "core" {
  backend = "s3"

  config {
    region = "${var.aws_region}"
    bucket = "jhg-tf-remote-state"
    key    = "main/main.tfstate"
  }
}
