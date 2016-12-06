provider "aws" {
  region = "${var.aws_region}"
}

variable "aws_region" {
  default = "us-west-2"
}

variable "key_pair_name" {
  default = "jake-laptop-aws"
}

variable "app_ami_id" {
  default = "ami-1947ef79"
}

variable "instance_type" {
  default = "m1.small"
}

variable "subdomain" {
  default = "pct"
}