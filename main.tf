
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

# Terraformで構築するAWS
# https://y-ohgi.com/introduction-terraform/handson/vpc/

resource "aws_subnet" "public_1a" {
  vpc_id = "${aws_vpc.orange.id}"
  availability_zone = "ap-northeast-1a"
  cidr_block        = "10.0.1.0/24"
  tags = {
    Name = "orange-subpub-1a"
  }
}

resource "aws_subnet" "public_1c" {
  vpc_id = "${aws_vpc.orange.id}"
  availability_zone = "ap-northeast-1c"
  cidr_block        = "10.0.2.0/24"
  tags = {
    Name = "orange-subpub-1c"
  }
}

# 【Terraform】AWS上にEC2インスタンス作成(入門)
# https://zenn.dev/supersatton/articles/c87853cc5a3dbd

