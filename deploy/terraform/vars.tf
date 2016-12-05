provider "aws" {
  region = "${var.aws_region}"
}

variable "aws_region" {
  default = "us-west-2"
}

variable "key_pair_name" {
  default = "jake-laptop-aws"
}

variable "base_ami_id" {
  default = "ami-d2d27bb2"
}

variable "instance_type" {
  default = "t2.small"
}