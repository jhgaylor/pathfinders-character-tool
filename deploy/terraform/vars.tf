provider "aws" {
  region = "${var.aws_region}"
}

variable "aws_region" {
  default = "us-west-2"
}

variable "app_name" {
  default = "pathfinder-character-tool"
}

variable "key_pair_name" {
  default = "jake-laptop-aws"
}

variable "instance_type" {
  default = "m1.small"
}

variable "subdomain" {
  default = "pct"
}

variable "instance_count" {
  default = 1
}

variable "owner" {
  default = "jake"
}