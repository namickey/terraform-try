# Terraform Cloudの始め方
# https://qiita.com/boccham/items/190f04bfbc9ffc0b5baf

variable "aws_access_key" {}
variable "aws_secret_key" {}

provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region = "ap-northeast-1"
}

resource "aws_vpc" "orange" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "orange-vpc"
  }
}
