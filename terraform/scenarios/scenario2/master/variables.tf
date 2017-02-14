provider "aws" {
  region = "${var.region}"
}

variable "region" {}
variable "envname" {}
variable "prefix_ip" {}
variable "availability_zone" {
  default = [
    "ap-northeast-1a",
    "ap-northeast-1c"
  ]
}
variable "key_name" {}


variable "developer_ip" {
  default = []
}
